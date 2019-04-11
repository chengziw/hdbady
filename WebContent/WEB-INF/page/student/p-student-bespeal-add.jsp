<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<!--<link rel="stylesheet" href="demo.css" type="text/css" />-->
	<title>入园预约</title>
	<link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="parent/css/main.css">
	<link rel="stylesheet" href="parent/css/ruyuanyuyue.css">
	<!--[if lt IE 9]>
	<script src="lib/html5shiv/html5shiv.min.js"></script>
	<script src="lib/respond/respond.min.js"></script>
	<![endif]-->
	<script src="parent/lib/jquery/jquery.js"></script>
	<script src="parent/lib/bootstrap/js/bootstrap.js"></script>
	<script src="parent/js/main.js"></script>
	<link href="parent/js/rilixuanzeqi/mobiscroll.css" rel="stylesheet" type="text/css">
	<script src="parent/js/rilixuanzeqi/jquery.1.7.2.min.js"></script>
	<script src="parent/js/rilixuanzeqi/mobiscroll.js" type="text/javascript"></script>




</head>

<body>

<div class="neirong" id="youeryuan">
	<header>
			<span class="glyphicon glyphicon-menu-left">入园预约</span>

	</header>



	<section>

		<div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
			<ul id="myTabs" class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">预约学校</a></li>
				<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">预约记录</a></li>

			</ul>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">



					<!--/////////////////////////////-->
					<form id="form" method="post" action="">


						<div class="nianji">
							<div ><span>所报学校 ：</span><h4 class="xiaoming">&nbsp;汤圆幼儿园</h4></div>
							<span>所报年级 ： </span>
							<select class="form-control select">
								<option>托班</option>
								<option>小班</option>
								<option>中班</option>
								<option>大班</option>
							</select>
						</div>
						<div class="baodaoshijian">
							<span>报到时间 ：</span>
							<input value="" class="" readonly name="appDate" id="appDate" type="text" placeholder="请输入日期...">

						</div>

						<div class="form-group">
							<span >宝贝姓名 ：</span>
							<input type="text" class="form-control notkong " id="exampleInputName2">
						</div>


					<div class="xingbie">
						<span class="xingbiezi">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ：&nbsp;</span>
						<div class="xuanze">
							<label class="radio-inline">
								<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked"> <span>男</span>
							</label>
							<label class="radio-inline">
								<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> <span>女</span>
							</label>

						</div>
					</div>


						<div class="baodaoshijian">
							<span>宝贝生日 ：</span>
							<input value="" class="" readonly name="appDate" id="appDate1" type="text" placeholder="请输入日期...">

						</div>
						<div class="form-group">
							<span >家长姓名 ：</span>
							<input type="text" class="form-control notkong" >
						</div>


						<div class="guanxi">
							<span>家长关系 ： </span>
							<select class="form-control select">
								<option>爸爸</option>
								<option>妈妈</option>
								<option>爷爷</option>
								<option>奶奶</option>
								<option>外公</option>
								<option>外婆</option>
								<option>哥哥</option>
								<option>姐姐</option>
							</select>
						</div>


						<div class="form-group">
							<span >家长手机 ：</span>
							<input type="text" class="form-control notkong" >
						</div>



					<div class="shurukuang">
						<textarea class="form-control" rows="4" placeholder="请输入您的要求..."></textarea>
					</div>






					<div class="tiqiao">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="buttontijiao">立即预约</button>
					</div>
					</form>
				</div>



				<!--///////////////-->
				<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
					<!--<p>请假记录页面</p>-->


				<ul class="ul-list" id="ul-list">


				</ul>


				</div>

			</div>
		</div>







		<script src="parent/js/ruyuanyuyue.js"></script>

	</section>

</div>




</body>

</html>
<script type="text/javascript">
	$(function () {
		var currYear = (new Date()).getFullYear();
		var opt={};
		opt.date = {preset : 'date'};
		opt.datetime = {preset : 'datetime'};
		opt.time = {preset : 'time'};
		opt.default = {
			theme: 'android-ics light', //皮肤样式
			display: 'modal', //显示方式
			mode: 'scroller', //日期选择模式
			dateFormat: 'yyyy-mm-dd',
			lang: 'zh',
			showNow: true,
			nowText: "今天",
			startYear: currYear - 100, //开始年份
			endYear: currYear + 100 //结束年份
		};

		var date1 = $("#appDate").mobiscroll($.extend(opt['date'], opt['default']));
		$("#appDate1").mobiscroll($.extend(opt['date'], opt['default']));


		var optDateTime = $.extend(opt['datetime'], opt['default']);
		var optTime = $.extend(opt['time'], opt['default']);
		$("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
		$("#appTime").mobiscroll(optTime).time(optTime);



	});
</script>
<!--效果html结束-->









