<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="s" uri="/struts-tags" %>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>课程安排</title>
  <meta name="viewport" content="initial-scale=1, maximum-scale=1">
  <link rel="shortcut icon" href="/favicon.ico">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <link rel="stylesheet" href="parent/css/main1.css">
  <link rel="stylesheet" href="parent/css/javascript.fullPage.css">
  <script src="parent/js/jquery.js" type="text/javascript"></script>
  <script src="parent/js/main.js" type="text/javascript"></script>
  <script src="parent/js/jquery.fullPage.js" type="text/javascript"></script>

  <style>
    .zhiding{
      position: absolute;
      top: 0;
      width: 100%;

    }
    .zhiding dd{
      width: 100%;

      text-align: left;
      padding-left: 26%;

    }
  </style>
</head>
<body>
<div class="header"><a href="studentAction_p_home.action" class="pull-left"><img class="dayuhao" src="images/left.png" alt=""></a><span class="pull-left">课程安排</span></div>
<div class="content" style="height:2rem;width:100%;">
</div>
<div id="fullpage">

  <div class="section zhengchang">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1 ">1shangwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">1shangwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">1shangwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">1shangwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">1shangwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax">
        <dd>中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >1xiawu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >1xiawu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">1xiawu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">1xiawu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">1xiawu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section zhengchang" >
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">2shangwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">2shangwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">2shangwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">2shangwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">2shangwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax">
        <dd>中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >2xiawu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >2xiawu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">2xiawu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">2xiawu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">2xiawu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section zhengchang">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">3shangwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">3shangwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">3shangwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">3shangwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">3shangwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax">
        <dd>中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >3xiawu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >3xiawu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">3xiawu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">3xiawu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">3xiawu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section zhengchang">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">4xiawu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">4xiawu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">4xiawu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">4xiawu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">4xiawu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax">
        <dd>中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >4xiawu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >4xiawu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">4xiawu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">4xiawu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">4xiawu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section zhengchang">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">4sahngwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">4sahngwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">4sahngwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">4sahngwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">4sahngwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax">
        <dd>中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >4xianwu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >4xianwu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">4xianwu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">4xianwu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">4xianwu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section xingqiliu">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">5shangwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">5shangwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">5shangwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">5shangwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">5shangwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax zhouliuxiuxi">
        <dd class="">中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >5xiawu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >5xiawu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">5xiawu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">5xiawu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">5xiawu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>
  <div class="section xingqitian">
          <span class="width10">
            <b>上午</b>
            <b>下午</b>
          </span>
    <ul class="table_kc">
      <li>
        <dl>
          <dd class="shangwu1">6shangwu1</dd>
          <dd >8:30—9：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu2">6shangwu2</dd>
          <dd>9:30—10：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu3">6shangwu3</dd>
          <dd>10:30—11：00</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu4">6shangwu4</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="shangwu5">6shangwu5</dd>
          <dd>11:00—11：30</dd>
        </dl>
      </li>
      <li class="relax zhoutianxiuxi">
        <dd class="">中午休息时间</dd>
      </li>
      <li>
        <dl>
          <dd  class="xiawu1" >6xianwu1</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu2" >6xianwu2</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu3">6xianwu3</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu4">6xianwu4</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
      <li>
        <dl>
          <dd  class="xiawu5">6xianwu5</dd>
          <dd>9:30—10：10</dd>
        </dl>
      </li>
    </ul>
    <div class="clear"></div>
  </div>

  <div class="clear"></div>
</div>
</body>
</html>
<script type="text/javascript">
  $(function(){
    $('#fullpage').fullpage({
      'verticalCentered': false,
      'css3': true,
      'sectionsColor': ['#a16364', '#ab9176', '#70c3a5', '#a2a771', '#6c9e9d', '#5f628b', '#876186'],
      anchors: ['page1', 'page2', 'page3', 'page4', 'page5', 'page6', 'page7'],
      'navigation': true,
      'navigationPosition': 'left'
    })
  })

</script>
<script>
  window.onload = function(){

//    var fanhui = $(".dayuhao")[0];
//    fanhui.onclick= function () {
//      //console.log(fanhui);
//      window.history.back(-1);
//    };

    $("#fp-nav ul li span").eq(0).text("星期一");
    $("#fp-nav ul li span").eq(1).text("星期二");
    $("#fp-nav ul li span").eq(2).text("星期三");
    $("#fp-nav ul li span").eq(3).text("星期四");
    $("#fp-nav ul li span").eq(4).text("星期五");
    $("#fp-nav ul li span").eq(5).text("星期六");
    $("#fp-nav ul li span").eq(6).text("星期日");
    chang();
    $(window).resize(function(){
      chang();
    })
    $(window).resize();
    function chang(){
      var $height = $("#fp-nav ul li").height();
      var $height_kc = $("ul.table_kc li").height();
      $("#fp-nav ul li").css('line-height',$height+'px');
      $(".relax").css('line-height',$height_kc+'px');
    }
  }
</script>
<script>
  !function(win) {
    function resize() {
      var domWidth = domEle.getBoundingClientRect().width;
      if(domWidth / v > 540){
        domWidth = 540 * v;
      }
      win.rem = domWidth / 16;
      domEle.style.fontSize = win.rem + "px";
    }
    var v, initial_scale, timeCode, dom = win.document, domEle = dom.documentElement, viewport = dom.querySelector('meta[name="viewport"]'), flexible = dom.querySelector('meta[name="flexible"]');
    if (viewport) {
      //viewport：<meta name="viewport"content="initial-scale=0.5, minimum-scale=0.5, maximum-scale=0.5,user-scalable=no,minimal-ui"/>
      var o = viewport.getAttribute("content").match(/initial\-scale=(["']?)([\d\.]+)\1?/);
      if(o){
        initial_scale = parseFloat(o[2]);
        v = parseInt(1 / initial_scale);
      }
    } else {
      if (flexible) {
        var o = flexible.getAttribute("content").match(/initial\-dpr=(["']?)([\d\.]+)\1?/);
        if(o){
          v = parseFloat(o[2]);
          initial_scale = parseFloat((1 / v).toFixed(2))
        }
      }
    }
    if (!v && !initial_scale) {
      var n = (win.navigator.appVersion.match(/android/gi), win.navigator.appVersion.match(/iphone/gi));
      v = win.devicePixelRatio;
      v = n ? v >= 3 ? 3 : v >= 2 ? 2 : 1 : 1, initial_scale = 1 / v
    }
    //没有viewport标签的情况下
    if (domEle.setAttribute("data-dpr", v), !viewport) {
      if (viewport = dom.createElement("meta"), viewport.setAttribute("name", "viewport"), viewport.setAttribute("content", "initial-scale=" + initial_scale + ", maximum-scale=" + initial_scale + ", minimum-scale=" + initial_scale + ", user-scalable=no"), domEle.firstElementChild) {
        domEle.firstElementChild.appendChild(viewport)
      } else {
        var m = dom.createElement("div");
        m.appendChild(viewport), dom.write(m.innerHTML)
      }
    }
    win.dpr = v;
    win.addEventListener("resize", function() {
      clearTimeout(timeCode), timeCode = setTimeout(resize, 300)
    }, false);
    win.addEventListener("pageshow", function(b) {
      b.persisted && (clearTimeout(timeCode), timeCode = setTimeout(resize, 300))
    }, false);
    /* 个人觉得没必要完成后就把body的字体设置为12
     "complete" === dom.readyState ? dom.body.style.fontSize = 12 * v + "px" : dom.addEventListener("DOMContentLoaded", function() {
     //dom.body.style.fontSize = 12 * v + "px"
     }, false);
     */
    resize();
  }(window);
</script>


<script>

  $.ajax({
    type: 'post',
    url: 'curriculaTableAction_t_look.action',

    dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
    success: function (data) {

//[{id : 1, name: '周六和周日无补课'}, {id: 2, name: '仅周六补课'}, {id: 3, name: '仅周日补课'}, {id: 4, name: '周六和周日都补课'}],



      $(".shangwu1,.shangwu2,.shangwu3,.shangwu4,.shangwu5,.xiawu1,.xiawu2,.xiawu3,.xiawu4,.xiawu5").html("");
      $(".shangwu1,.shangwu2,.shangwu3,.shangwu4,.shangwu5,.xiawu1,.xiawu2,.xiawu3,.xiawu4,.xiawu5").parent().children(1).html("");



      console.log(data)
      console.log(data.week_type_label)
      switch (data.week_type_label) {
        case "1":

                var shangwu1s = $(".zhengchang .shangwu1");
                var shangwu2s = $(".zhengchang .shangwu2");
                var shangwu3s = $(".zhengchang .shangwu3");
                var shangwu4s = $(".zhengchang .shangwu4");
                var shangwu5s = $(".zhengchang .shangwu5");

                var xiawu1s = $(".zhengchang .xiawu1");
                var xiawu2s = $(".zhengchang .xiawu2");
                var xiawu3s = $(".zhengchang .xiawu3");
                var xiawu4s = $(".zhengchang .xiawu4");
                var xiawu5s = $(".zhengchang .xiawu5");


                $(".zhouliuxiuxi").addClass("zhiding").html("休息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ");
                $(".zhoutianxiuxi").addClass("zhiding").html("休息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ");




              break;
        case "2":

          var shangwu1s = $(".zhengchang .shangwu1,.xingqiliu .shangwu1");
          var shangwu2s = $(".zhengchang .shangwu2,.xingqiliu .shangwu2");
          var shangwu3s = $(".zhengchang .shangwu3,.xingqiliu .shangwu3");
          var shangwu4s = $(".zhengchang .shangwu4,.xingqiliu .shangwu4");
          var shangwu5s = $(".zhengchang .shangwu5,.xingqiliu .shangwu5");

          var xiawu1s = $(".zhengchang .xiawu1,.xingqiliu .xiawu1");
          var xiawu2s = $(".zhengchang .xiawu2,.xingqiliu .xiawu2");
          var xiawu3s = $(".zhengchang .xiawu3,.xingqiliu .xiawu3");
          var xiawu4s = $(".zhengchang .xiawu4,.xingqiliu .xiawu4");
          var xiawu5s = $(".zhengchang .xiawu5,.xingqiliu .xiawu4");


          $(".zhoutianxiuxi").addClass("zhiding").html("休息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ");

          break;
        case "3":

          var shangwu1s = $(".zhengchang .shangwu1,.xingqitian .shangwu1");
          var shangwu2s = $(".zhengchang .shangwu2,.xingqitian .shangwu2");
          var shangwu3s = $(".zhengchang .shangwu3,.xingqitian .shangwu3");
          var shangwu4s = $(".zhengchang .shangwu4,.xingqitian .shangwu4");
          var shangwu5s = $(".zhengchang .shangwu5,.xingqitian .shangwu5");



          var xiawu1s = $(".zhengchang .xiawu1,.xingqitian .xiawu1");
          var xiawu2s = $(".zhengchang .xiawu2,.xingqitian .xiawu2");
          var xiawu3s = $(".zhengchang .xiawu3,.xingqitian .xiawu3");
          var xiawu4s = $(".zhengchang .xiawu4,.xingqitian .xiawu4");
          var xiawu5s = $(".zhengchang .xiawu5,.xingqitian .xiawu4");



          $(".zhouliuxiuxi").addClass("zhiding").html("休息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ");
          break;
        case "4":

          var shangwu1s = $(" .shangwu1");
          var shangwu2s = $(" .shangwu2");
          var shangwu3s = $(" .shangwu3");
          var shangwu4s = $(" .shangwu4");
          var shangwu5s = $(" .shangwu5");

          var xiawu1s = $(" .xiawu1");
          var xiawu2s = $(" .xiawu2");
          var xiawu3s = $(" .xiawu3");
          var xiawu4s = $(" .xiawu4");
          var xiawu5s = $(" .xiawu5");



          break;
      }




//       "morning_has_num": "4",
//      "afternoon_has_num": "3",

      var shangk = (data.morning_has_num-0);
      var xiak =  (data.afternoon_has_num-0);

      console.log(shangk)
      console.log(xiak)

      var step = (data.morning_has_num-0)+ (data.afternoon_has_num-0);





      var i = 0;
      var i1 = 0;
      var i2 = 0;
      var i3 = 0;
      var i4 = 0;
      var i5 = 0;
      var i6 = 0;
      var i7 = 0;
      var i8 = 0;
      var i9 = 0;

      $(data.rows).each(function (index, value) {



              if(shangk == 1){
                if(index%step == 0){

                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu1s[i1]).parent().html("");
                  }
                  $(shangwu1s[i1]).html(li);

                  i1++;
                }

                if(xiak ==1){
                  if(index%step == 1){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                }
                if(xiak ==2){
                  if(index%step == 1){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                }
                if(xiak ==3){
                  if(index%step == 1){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                }
                if(xiak ==4){
                  if(index%step == 1){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }
                }
                if(xiak ==5){
                  if(index%step == 1){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }

                  //第10节课 ，下午第五节课
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu5s[i]).parent().html("");
                    }
                    $(xiawu5s[i]).html(li);

                    i++;
                  }
                }
              }
              if(shangk == 2){
                if(index%step == 0){

                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu1s[i1]).parent().html("");
                  }
                  $(shangwu1s[i1]).html(li);

                  i1++;
                }
                else if(index%step == 1){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu2s[i2]).parent().html("");
                  }
                  $(shangwu2s[i2]).html(li);

                  i2++;
                }

                if(xiak ==1){
                  if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                }
                if(xiak ==2){
                  if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                }
                if(xiak ==3){
                  if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                }
                if(xiak ==4){
                  if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }
                }
                if(xiak ==5){
                  if(index%step == 2){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }

                  //第10节课 ，下午第五节课
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu5s[i]).parent().html("");
                    }
                    $(xiawu5s[i]).html(li);

                    i++;
                  }
                }
              }
              if(shangk == 3){
                if(index%step == 0){

                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu1s[i1]).parent().html("");
                  }
                  $(shangwu1s[i1]).html(li);

                  i1++;
                }
                else if(index%step == 1){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu2s[i2]).parent().html("");
                  }
                  $(shangwu2s[i2]).html(li);

                  i2++;
                }
                else if(index%step == 2){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu3s[i3]).parent().html("");
                  }
                  $(shangwu3s[i3]).html(li);

                  i3++;
                }


                if(xiak ==1){
                  if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                }
                if(xiak ==2){
                  if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                }
                if(xiak ==3){
                  if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                }
                if(xiak ==4){
                  if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }
                }
                if(xiak ==5){
                  if(index%step == 3){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }

                  //第10节课 ，下午第五节课
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu5s[i]).parent().html("");
                    }
                    $(xiawu5s[i]).html(li);

                    i++;
                  }
                }
              }
              if(shangk == 4){
                if(index%step == 0){

                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu1s[i1]).parent().html("");
                  }
                  $(shangwu1s[i1]).html(li);

                  i1++;
                }
                else if(index%step == 1){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu2s[i2]).parent().html("");
                  }
                  $(shangwu2s[i2]).html(li);

                  i2++;
                }
                else if(index%step == 2){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu3s[i3]).parent().html("");
                  }
                  $(shangwu3s[i3]).html(li);

                  i3++;
                }
                else if(index%step == 3){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu4s[i4]).parent().html("");
                  }
                  $(shangwu4s[i4]).html(li);

                  i4++;
                }


                if(xiak ==1){
                  if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                }
                if(xiak ==2){
                  if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                }
                if(xiak ==3){
                  if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                }
                if(xiak ==4){
                  if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }
                }
                if(xiak ==5){
                  if(index%step == 4){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }

                  //第10节课 ，下午第五节课
                  else if(index%step == 8){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu5s[i]).parent().html("");
                    }
                    $(xiawu5s[i]).html(li);

                    i++;
                  }
                }
              }
              if(shangk == 5){
                if(index%step == 0){

                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu1s[i1]).parent().html("");
                  }
                  $(shangwu1s[i1]).html(li);

                  i1++;
                }
                else if(index%step == 1){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu2s[i2]).parent().html("");
                  }
                  $(shangwu2s[i2]).html(li);

                  i2++;
                }
                else if(index%step == 2){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu3s[i3]).parent().html("");
                  }
                  $(shangwu3s[i3]).html(li);

                  i3++;
                }
                else if(index%step == 3){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu4s[i4]).parent().html("");
                  }
                  $(shangwu4s[i4]).html(li);

                  i4++;
                }
                else if(index%step == 4){
                  var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                  if(value.afternoon_has_num == ""){
                    $(shangwu5s[i5]).parent().html("");
                  }
                  $(shangwu5s[i5]).html(li);

                  i5++;
                }

                if(xiak ==1){
                  if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                }
                if(xiak ==2){
                  if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                }
                if(xiak ==3){
                  if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                }
                if(xiak ==4){
                  if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 8){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }
                }
                if(xiak ==5){
                  if(index%step == 5){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu1s[i6]).parent().html("");
                    }
                    $(xiawu1s[i6]).html(li);

                    i6++;
                  }
                  else if(index%step == 6){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu2s[i7]).parent().html("");
                    }
                    $(xiawu2s[i7]).html(li);

                    i7++;
                  }
                  else if(index%step == 7){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu3s[i8]).parent().html("");
                    }
                    $(xiawu3s[i8]).html(li);

                    i8++;
                  }
                  else if(index%step == 8){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu4s[i9]).parent().html("");
                    }
                    $(xiawu4s[i9]).html(li);

                    i9++;
                  }

                  //第10节课 ，下午第五节课
                  else if(index%step == 9){
                    var li = value.afternoon_has_num+" ( "+value.teacher_name+" ) ";
                    if(value.afternoon_has_num == ""){
                      $(xiawu5s[i]).parent().html("");
                    }
                    $(xiawu5s[i]).html(li);

                    i++;
                  }
                }
              }














      });





    },
    error: function () {
      alert("error occured!!!");
    }

  });

</script>