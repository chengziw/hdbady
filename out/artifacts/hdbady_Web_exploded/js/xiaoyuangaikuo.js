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
    top.location = "studentAction_p_home.action";
};


$(function () {
        $.ajax({
            type: 'post',
            url: 'parent/json/xiaoyuangaikuo.json',
            async: false,

            dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
            success: function (data) {


                var tupianhao1="";
                var tupianxiang=
                     "";
                    ;
                $(data.xiaoyuanhuanjing).each(function (index, value) {





                   if(index == 0){
                       tupianhao1+=  '       <li data-target="#carousel-example-generic" data-slide-to=index  class="active"></li>';
                       tupianxiang+=
                           '       <div class="item active" >'+
                           '       <img src='+this.img+' alt="...">'/*+
                           '       <div class="carousel-caption">'+
                          this.imgmiaoshu+
                           '       </div>'*/+
                           '       </div>';

                   }else{

                       tupianhao1+=  '       <li data-target="#carousel-example-generic" data-slide-to=index></li>';
                       tupianxiang+=
                           '       <div class="item" >'+
                           '       <img src='+this.img+' alt="...">'/*+
                           '       <div class="carousel-caption">'+
                           this.imgmiaoshu+
                           '       </div>'*/+
                           '       </div>';
                   }



                })



                $("#xiaoyuanhuanjinglunbo").html(

             '   <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">'+
             '           <!-- Indicators -->'+
             '       <ol class="carousel-indicators" id="tupianhao1">'+
                        tupianhao1+
             '       </ol>'+
''+
             '           <!-- Wrapper for slides -->'+
             '       <div class="carousel-inner" role="listbox" id="puone1">'+

             tupianxiang+

             '       </div>'+
''+
             '           <!-- Controls -->'+
             '       <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">'+
             '       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>'+
             '       <span class="sr-only">Previous</span>'+
             '       </a>'+
             '       <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">'+
             '       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>'+
             '       <span class="sr-only">Next</span>'+
             '       </a>'+
             '       </div>'
                );


                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




                $("#xiaoyuanjianjie").html(data.xiaoyuanjianjie);

                ////////////////////////////////////////////////////////////////////

                var tupianhao2="";
                var tupianxiang2=
                    "";
                ;
                $(data.baobeizuopin).each(function (index, value) {





                    if(index == 0){
                        tupianhao2+=  '       <li data-target="#carousel-example-generic1" data-slide-to=index  class="active"></li>';
                        tupianxiang2+=
                            '       <div class="item active" >'+
                            '       <img src='+this.img+' alt="...">'/*+
                            '       <div class="carousel-caption">'+
                            this.imgmiaoshu+
                            '       </div>'*/+
                            '       </div>';

                    }else{

                        tupianhao2+=  '       <li data-target="#carousel-example-generic1" data-slide-to=index></li>';
                        tupianxiang2+=
                            '       <div class="item" >'+
                            '       <img src='+this.img+' alt="...">'/*+
                            '       <div class="carousel-caption">'+
                            this.imgmiaoshu+
                            '       </div>'*/+
                            '       </div>';
                    }



                })



                $("#baobeizuopin").html(

                    '   <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">'+
                    '           <!-- Indicators -->'+
                    '       <ol class="carousel-indicators" id="tupianhao1">'+
                    tupianhao2+
                    '       </ol>'+
                    ''+
                    '           <!-- Wrapper for slides -->'+
                    '       <div class="carousel-inner" role="listbox" id="puone1">'+

                    tupianxiang2+

                    '       </div>'+
                    ''+
                    '           <!-- Controls -->'+
                    '       <a class="left carousel-control" href="#carousel-example-generic1" role="button" data-slide="prev">'+
                    '       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>'+
                    '       <span class="sr-only">Previous</span>'+
                    '       </a>'+
                    '       <a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">'+
                    '       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>'+
                    '       <span class="sr-only">Next</span>'+
                    '       </a>'+
                    '       </div>'
                );

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


                /* "ertongnianling":"1-6",
                 "xiaobanrenshu":"30",
                 "dabanrenshu":"33",
                 "zhongbanrenshu":"44",
                 "baoyufei":"3333"*/
                /*$("#nianling").html(data.ertongnianling);
                $("#xiaobanrenshu").html(data.xiaobanrenshu);
                $("#dabanrenshu").html(data.dabanrenshu);
                $("#zhongbanrenshu").html(data.zhongbanrenshu);
                $("#feiyong").html(data.baoyufei);*/

            },
            error: function () {
                alert("error occured!!!");
            }

        });

    }
)

