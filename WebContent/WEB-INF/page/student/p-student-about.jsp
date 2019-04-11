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


	<title>宝贝档案</title>
	<link rel="stylesheet" href="parent/tupianliulan/css/baguettebox.min.css">
	<link rel="stylesheet" href="parent/tupianliulan/css/lrtk.css">
	<script src="parent/tupianliulan/js/baguettebox.min.js"></script>


	<style>
		.baguetteBoxOne {
			width: 100%;
			margin: 0 auto;
			margin-top: 45px;
			background: #000000;
			/* background: #111111; */
		}
		#baguetteBox-overlay {
			background:rgba(0,0,0,1);
		}



	</style>
	<!--<link rel="stylesheet" href="demo.css" type="text/css" />-->
	<title>宝贝档案</title>
	<link rel="stylesheet" href="parent/lib/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="parent/css/main.css">
	<link rel="stylesheet" href="parent/css/bangbeidangan.css">
	<!--[if lt IE 9]>
	<script src="lib/html5shiv/html5shiv.min.js"></script>
	<script src="lib/respond/respond.min.js"></script>
	<![endif]-->
	<script src="parent/lib/jquery/jquery.js"></script>
	<script src="parent/lib/bootstrap/js/bootstrap.js"></script>
	<script src="parent/js/main.js"></script>

	<link href="parent/js/rilixuanzeqi/mobiscroll.css" rel="stylesheet" type="text/css">
	<script src="parent/js/rilixuanzeqi/jquery.1.7.2.min.js"></script>
	<script src="parent/js/iscroll.js"></script>






</head>

<body style="">



<div class="neirong" id="youeryuan">
	<header>
			<span class="glyphicon glyphicon-menu-left">宝贝档案</span>

	</header>



	<section>

		<div class="bs-example bs-example-tabs clearfix" data-example-id="togglable-tabs">
			<ul id="myTabs" class="nav nav-tabs " role="tablist">
				<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">基本信息</a></li>
				<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">宝贝图片</a></li>

			</ul>
			<div id="myTabContent" class="tab-content">
				<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">



					<!--/////////////////////////////-->
					<!--<table class="">-->
						<!--<tr>-->
							<!--<td>姓名</td>-->
							<!--<td>唐洋洋</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>性别</td>-->
							<!--<td>男</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>生日</td>-->
							<!--<td>2017-4-12</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>学号</td>-->
							<!--<td>1401312</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>学校</td>-->
							<!--<td>汤圆幼儿园</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>当前班级</td>-->
							<!--<td>托班(二班)</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>特长爱好</td>-->
							<!--<td>唱歌，跳舞</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>家长姓名</td>-->
							<!--<td>唐永辉(爸爸)</td>-->
						<!--</tr>-->
						<!--<tr>-->
							<!--<td>家长电话</td>-->
							<!--<td>184458338283</td>-->
						<!--</tr>-->

					<!--</table>-->

				</div>



				<!--///////////////-->
				<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
					<!--<p>请假记录页面</p>-->





					<div class="baguetteBoxOne gallery" id="jiatupian">
						<!--<a href="tupianliulan/images/1-1.jpg" data-caption="Golden Gate Bridge"><img src="tupianliulan/images/thumbs/1-1.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-2.jpg" title="Midnight City"><img src="tupianliulan/images/thumbs/1-2.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-3.jpg"><img src="tupianliulan/images/thumbs/1-3.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-4.jpg"><img src="tupianliulan/images/thumbs/1-4.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-5.jpg"><img src="tupianliulan/images/thumbs/1-5.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-5.jpg"><img src="tupianliulan/images/thumbs/1-5.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-6.jpg"><img src="tupianliulan/images/thumbs/1-6.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-7.jpg"><img src="tupianliulan/images/thumbs/1-7.jpg"></a>-->
						<!--<a href="tupianliulan/images/1-8.jpg"><img src="tupianliulan/images/thumbs/1-8.jpg"></a>-->
					</div>



					<script>



						function aa() {

							var index = 0;

							var flag = true;
							var ss = "";


								$("#profile-tab").click(function () {

									$(this).html(ss);

									if(flag) {


										$.ajax({
											type: 'post',
											url: 'studentAction_p_studentPhone.action',

											data: {"yema": index},
											dataType: 'json', //很重要!!!.预期服务器返回的数据类型 , */
											success: function (data) {


												index++;
												/* "haseMore":true,
											 "img":[
											 {
											 "imgurl":"images/close.png"
											 },*/
												/*<a href="tupianliulan/images/1-1.jpg" data-caption="Golden Gate Bridge"><img src="tupianliulan/images/thumbs/1-1.jpg"></a>
											 <a href="tupianliulan/images/1-2.jpg" title="Midnight City"><img src="tupianliulan/images/thumbs/1-2.jpg"></a>
											 <a href="tupianliulan/images/1-3.jpg"><img src="tupianliulan/images/thumbs/1-3.jpg"></a>
											 <a href="tupianliulan/images/1-4.jpg"><img src="tupianliulan/images/thumbs/1-4.jpg"></a>
											 <a href="tupianliulan/images/1-5.jpg"><img src="tupianliulan/images/thumbs/1-5.jpg"></a>
											 <a href="tupianliulan/images/1-6.jpg"><img src="tupianliulan/images/thumbs/1-6.jpg"></a>
											 <a href="tupianliulan/images/1-7.jpg"><img src="tupianliulan/images/thumbs/1-7.jpg"></a>
											 <a href="tupianliulan/images/1-8.jpg"><img src="tupianliulan/images/thumbs/1-8.jpg"></a>
											 */


											var div = $("#jiatupian");


											$(data.img).each(function (index, value) {

												var a = $("<a href=" + this.imgurl + "><img src=" + this.imgurl + "></a>");

												$(div).append(a);
											})

											$("#profile").append(div);

											if (data.haseMore) {

												flag = true;
												$(that).html("点击加载");
												ss = "点击加载";
//												var div = $("#jiatupian");
//
//
//												$(data.img).each(function (index, value) {
//
//													var a = $("<a href="+this.imgurl+"><img src="+this.imgurl+"></a>");
//
//													$(div).append(a);
//												})
//
//												$("#profile").append(div);


											}
											else {
												flag = false;
												$(that).html("没有了");
												ss = "没有了";
											}


											baguetteBox.run('.baguetteBoxOne', {
												animation: 'fadeIn',
											});


										},
										error: function () {
											//alert("error occured!!!");
										}

									});

										}

									var that = this;
									$("#home-tab").click(function () {
										$(that).html("宝贝图片");

									})


								});

						}

						aa();







					</script>

				</div>

			</div>
		</div>








		<script>
//			baguetteBox.run('.baguetteBoxOne', {
//				animation: 'fadeIn',
//			});
		</script>


	</section>

</div>



<script src="parent/js/baobeidangan.js"></script>
<!--<script src="js/rilixuanzeqi/mobiscroll.js" type="text/javascript"></script>-->


</body>

</html>
<script type="text/javascript">

</script>

<!--效果html结束-->









