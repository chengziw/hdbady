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
    top.location = "studentAction_p_home.action?flag="+flag+"";
    //window.history.back(-1);
};



var biaoji;
var yema = 1;
$(function () {
    $.ajax({
        type: 'post',
        url: 'askAction_p_pageQuery.action?page=1&rows=3&flag='+flag+'',

        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
        success: function (data) {
        	yema++;
            /* "askList": [
             {
             "answerItems": [
             {
             "answerId": "11",
             "title": "今天",
             "voterNumber": "1",
             "voterTurnout": "0.20"
             },
             {
             "answerId": 12,
             "title": "明天",
             "voterNumber": 3,
             "voterTurnout": 0.6
             },
             {
             "answerId": 13,
             "title": "后天",
             "voterNumber": "0",
             "voterTurnout": 0
             }
             ],
             "askId": 4,
             "createTime": "1484657752",
             "isAnonymous": 0,
             "isShowResults": 1,
             "isSinglesubmit": "True",
             "isSubmited": "True",
             "submitendDate": 1485446399,
             "submitNums": 5,
             "submitStartDate": "1484657752",
             "title": "那天放假"
             }*/



            $(data.askList).each(function (index, value) {

                //console.log(this.title);
                //console.log(this.createTime);
                var time = getshijiancha(this.createTime);

                /*<li class="aa">
                 <div class="bb">
                 <span class="title">国防生事故国防生事故国防生事故国防生事故</span>
                 <span class="glyphicon glyphicon-menu-right"></span>
                 <span class="shijian">2017-02-28</span>
                 </div>
                 <div class="btn">删除</div>
                 </li>*/
                var li = $("<li class='aa' ></li>").html(
                   " <div class='bb'>"+
                   " <span class='title'>"+this.title+"</span>"+
                    "<span class='glyphicon glyphicon-menu-right'></span>"+
                    "<span class='shijian'>"+time+"</span>"+
                    "</div>"+
                    "<div class='btn'>删除</div>"
                );
                $(".ul-list").prepend(li);

                li.on("click",".btn", function () {
                   //console.log("删除");
                    var dieli = this.parentNode;
                    //console.log(yeye);
                    dieli.remove();

                });






                var that = this;
              li.on("click",".glyphicon",function(){
                  //console.log("跳转");
                  $(".ul-list").hide();
                  $(".content").removeClass("hidden");
                  $(".content").show();

                  $("#fanli").click(function () {
                      $(".ul-list").show();
                      $(".content").hide();
                  });

                  $("#bilibiao").hide();
                  $(".tijiao").show();
                  $(".jieguo").html("查看结果");

                  $(".content-title").html(that.title);
                  var time = new Date(parseInt(that.createTime)).Format("yyyy-MM-dd hh:mm:ss");
                  $(".content-shijian").html(time);
                  $("#renshu").html(that.submitNums);

                  var timeend = new Date(parseInt(that.submitendDate)).Format("yyyy-MM-dd hh:mm:ss");
                  $(".jiesu").html(timeend);

                  var button = $("#buttontijiao");
                  button.html("提交");
                  button[0].removeAttribute("disabled");
                  if(new Date().getTime()>that.submitendDate){

                      button.html("已结束");
                      button[0].setAttribute("disabled","disabled");
                  }

                  $(".xuanxiang").html("");
                  $("table").html(
                      "<tr>"+
                      "<td>选项</td>"+
                      "<td>得票</td>"+
                      "<td>比例</td>"+
                      "</tr>");

                  $(that.answerItems).each(function (index, value) {

                      var div =$("<div>"+
                          " <label class='checkbox-inline'>"+
                          "<input name='askItemsId' value='"+ this.answerId +"' type='checkbox'> &nbsp&nbsp  "+ this.title+"  </label>"+
                       
                          "</div>");
                      $(".xuanxiang").append(div);
                      //console.log(this.title);

                    //////////////给结果添加
                  //
                      var tr =$("<tr>" +
                          "<td>"+this.title +"</td>" +
                          "<td>"+this.voterNumber +"</td>" +
                          "<td>"+this.voterTurnout*100+"%" +"</td>" +
                          "</tr>");
                      $("table").append(tr);
                      /*
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
                       </div>*/

                  });


                  var flag = true;
                  $(".jieguo").click(function () {

                      if(flag){
                          //console.log(1);
                          $(this).html("返回");
                          $(".tijiao").hide();
                          $("#bilibiao").show();
                          flag = false;
                      }
                      else{
                          //console.log(2);
                          $(this).html("查看结果");
                          $(".tijiao").show();
                          $("#bilibiao").hide();

                          flag = true;




                      }

                  });

              });


            })

            var div = $("<div class='jiazai' id='jiazai'>点击加载更多...</div>")

            if(data.hasMore){
                div.click(function () {

                    $.ajax({
                        type: 'post',
                        url: 'askAction_p_pageQuery.action',

                        data:{"page":yema,"rows":"3","flag":flag},
                        dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
                        success: function (data) {

                        	console.log("yema"+yema);
                        	yema++;
                            /* "askList": [
                             {
                             "answerItems": [
                             {
                             "answerId": "11",
                             "title": "今天",
                             "voterNumber": "1",
                             "voterTurnout": "0.20"
                             },
                             {
                             "answerId": 12,
                             "title": "明天",
                             "voterNumber": 3,
                             "voterTurnout": 0.6
                             },
                             {
                             "answerId": 13,
                             "title": "后天",
                             "voterNumber": "0",
                             "voterTurnout": 0
                             }
                             ],
                             "askId": 4,
                             "createTime": "1484657752",
                             "isAnonymous": 0,
                             "isShowResults": 1,
                             "isSinglesubmit": "True",
                             "isSubmited": "True",
                             "submitendDate": 1485446399,
                             "submitNums": 5,
                             "submitStartDate": "1484657752",
                             "title": "那天放假"
                             }*/



                            $(data.askList).each(function (index, value) {

                                //console.log(this.title);
                                //console.log(this.createTime);
                                var time = getshijiancha(this.createTime);

                                /*<li class="aa">
                                 <div class="bb">
                                 <span class="title">国防生事故国防生事故国防生事故国防生事故</span>
                                 <span class="glyphicon glyphicon-menu-right"></span>
                                 <span class="shijian">2017-02-28</span>
                                 </div>
                                 <div class="btn">删除</div>
                                 </li>*/
                                var li = $("<li class='aa' ></li>").html(
                                    " <div class='bb'>"+
                                    " <span class='title'>"+this.title+"</span>"+
                                    "<span class='glyphicon glyphicon-menu-right'></span>"+
                                    "<span class='shijian'>"+time+"</span>"+
                                    "</div>"+
                                    "<div class='btn'>删除</div>"
                                );
                                $(".ul-list").append(li,jiazai);

                                li.on("click",".btn", function () {
                                    //console.log("删除");
                                    var dieli = this.parentNode;
                                    //console.log(yeye);
                                    dieli.remove();
                                });






                                var that = this;
                                li.on("click",".glyphicon",function(){




                                    biaoji = window.pageYOffset;

                                    //console.log("跳转");
                                    $(".ul-list").hide();
                                    $(".content").removeClass("hidden");
                                    $(".content").show();

                                    $("#fanli").click(function () {
                                        $(".ul-list").show();
                                        $(".content").hide();
                                        $('body,html').animate({scrollTop:biaoji},0);
                                    });

                                    $("#bilibiao").hide();
                                    $(".tijiao").show();
                                    $(".jieguo").html("查看结果");

                                    $(".content-title").html(that.title);
                                    var time = new Date(parseInt(that.createTime)).Format("yyyy-MM-dd hh:mm:ss");
                                    $(".content-shijian").html(time);
                                    $("#renshu").html(that.submitNums);

                                    var timeend = new Date(parseInt(that.submitendDate)).Format("yyyy-MM-dd hh:mm:ss");
                                    $(".jiesu").html(timeend);

                                    var button = $("#buttontijiao");
                                    button.html("提交");
                                    button[0].removeAttribute("disabled");
                                    if(new Date().getTime()>that.submitendDate){

                                        button.html("已结束");
                                        button[0].setAttribute("disabled","disabled");
                                    }

                                    $(".xuanxiang").html("");
                                    $("table").html(
                                        "<tr>"+
                                        "<td>选项</td>"+
                                        "<td>得票</td>"+
                                        "<td>比例</td>"+
                                        "</tr>");

                                    $(that.answerItems).each(function (index, value) {

                                        var div =$("<div>"+
                                            " <label class='checkbox-inline'>"+
                                            "<input type='checkbox'> &nbsp&nbsp  "+ this.title+"  </label>"+

                                            "</div>");
                                        $(".xuanxiang").append(div);
                                        //console.log(this.title);

                                        //////////////给结果添加
                                        //
                                        var tr =$("<tr>" +
                                            "<td>"+this.title +"</td>" +
                                            "<td>"+this.voterNumber +"</td>" +
                                            "<td>"+this.voterTurnout*100+"%" +"</td>" +
                                            "</tr>");
                                        $("table").append(tr);
                                        /*
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
                                         </div>*/

                                    });


                                    var flag = true;
                                    $(".jieguo").click(function () {

                                        if(flag){
                                            //console.log(1);
                                            $(this).html("返回");
                                            $(".tijiao").hide();
                                            $("#bilibiao").show();
                                            flag = false;
                                        }
                                        else{
                                            //console.log(2);
                                            $(this).html("查看结果");
                                            $(".tijiao").show();
                                            $("#bilibiao").hide();

                                            flag = true;




                                        }

                                    });

                                });


                            })




                        },
                        error: function () {
                            //alert("error occured!!!");
                        }

                    });



                })
            }
            else{
                div.html("没有了...")
            }

            $(".ul-list").append(div);




        },
        error: function () {
            //alert("error occured!!!");
        }

    });

}
)





