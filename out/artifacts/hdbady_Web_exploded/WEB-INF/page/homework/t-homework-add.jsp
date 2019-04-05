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
	<!--<link rel="stylesheet" href="demo.css" type="text/css" />-->
	<title>每日作业</title>
	<link rel="stylesheet" href="teacher/lib/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="teacher/css/main.css">
	<link rel="stylesheet" href="teacher/css/meirizuoye_fabu.css">
	<!--[if lt IE 9]>
	<script src="lib/html5shiv/html5shiv.min.js"></script>
	<script src="lib/respond/respond.min.js"></script>
	<![endif]-->
	<script src="teacher/lib/jquery/jquery.js"></script>
	<script src="teacher/lib/bootstrap/js/bootstrap.js"></script>
	<script src="teacher/js/main.js"></script>
	<script src="teacher/js/tupianshangchuan/jquery.js"></script>
	<script src="teacher/js/meirizuoye_fubu.js"></script>
	<script src="teacher/js/tupianshangchuan/zxxFile.js"></script>

</head>

<body>

<div class="neirong" id="youeryuan">
	<header id="ha">
		<a href="${pageContext.request.contextPath}/homeWorkAction_t_homeWork.action">
			<span class="glyphicon glyphicon-menu-left">发布作业</span>
		</a>

	</header>

	<section>

		<div id="main">

			<div id="body" class="light">
				<div id="content" class="show">

					<div class="article_new"></div>
					<div class="demo">

						<form id="uploadForm" action="homeWorkAction_t_addHomeWork.action" method="post" enctype="multipart/form-data">

                            <div class="xueke">
								<input type="text" class="hidden" id="banhao" value="隐藏的班级号"/>
                                <!--<label class="checkbox-inline">-->
                                    <!--<input type="checkbox" id="inlineCheckbox1" value="option1"> 社会-->
                                <!--</label>-->
                                <!--<label class="checkbox-inline">-->
                                    <!--<input type="checkbox" id="inlineCheckbox2" value="option2"> 科学-->
                                <!--</label>-->
                                <!--<label class="checkbox-inline">-->
                                    <!--<input type="checkbox" id="inlineCheckbox3" value="option3"> 语文-->
                                <!--</label>-->
                            </div>

                            <div class="shurukuang">
                                <textarea class="form-control" name="descs" rows="5" placeholder="请输入要布置的作业..."></textarea>
                            </div>

                            <!--<div class="xuanzetupian">-->
                                <!--<span class="glyphicon glyphicon-plus-sign"></span>-->
                            <!--</div>-->

                            <div class="upload_box">
								<div class="upload_main">
									<div class="upload_choose">


										<div class="xuanzetupian">

											<input id="fileImage" type="file" size="30" name="fileselect" multiple />

										</div>
										<div class="upload_submit">
											<button type="button" id="fileSubmit" class="upload_submit_btn btn btn-primary btn-lg" >发表</button>
										</div>

									</div>

								</div>

								<div id="preview" class="upload_preview"></div>
								<div id="uploadInf" class="upload_inf"></div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
</body>
</html>

<script>

			var params = {
				fileInput: $("#fileImage").get(0),
				dragDrop: $("#fileDragArea").get(0),
				upButton: $("#fileSubmit").get(0),
				url: $("#uploadForm").attr("action"),
				filter: function(files) {
					var arrFiles = [];
					for (var i = 0, file; file = files[i]; i++) {
						if (file.type.indexOf("image") == 0) {
							if (file.size >= 5120000) {
								alert('您这张"'+ file.name +'"图片大小过大，应小于500k');
							} else {
								arrFiles.push(file);
							}
						} else {
							alert('文件"' + file.name + '"不是图片。');
						}
					}
					return arrFiles;
				},
				onSelect: function(files) {
					var html = '', i = 0;
					$("#preview").html('<div class="upload_loading"></div>');
					var funAppendImage = function() {
						file = files[i];
						if (file) {
							var reader = new FileReader()
							reader.onload = function(e) {
								html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p>'+
										'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
										'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'+
										'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
										'</div>';

								i++;
								funAppendImage();
							}
							reader.readAsDataURL(file);
						} else {
							$("#preview").html(html);
							if (html) {
								//删除方法
								$(".upload_delete").click(function() {
									ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
									return false;
								});
								//提交按钮显示
								$("#fileSubmit").show();
							} else {
								//提交按钮隐藏
								$("#fileSubmit").hide();
							}
						}
					};
					funAppendImage();
				},
				onDelete: function(file) {
					$("#uploadList_" + file.index).fadeOut();
				},
				onDragOver: function() {
					$(this).addClass("upload_drag_hover");
				},
				onDragLeave: function() {
					$(this).removeClass("upload_drag_hover");
				},
				onProgress: function(file, loaded, total) {
					var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded / total * 100).toFixed(2) + '%';
					eleProgress.show().html(percent);
				},
				onSuccess: function(file, response) {
					$("#uploadInf").append("<p>上传成功，图片地址是：" + response + "</p>");
				},
				onFailure: function(file) {
					$("#uploadInf").append("<p> 图片" + file.name + "上传失败！</p>");
					$("#uploadImage_" + file.index).css("opacity", 0.2);
				},
				onComplete: function() {
					//提交按钮隐藏
					$("#fileSubmit").hide();
					//file控件value置空
					$("#fileImage").val("");
					$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
				}
			};
			ZXXFILE = $.extend(ZXXFILE, params);
			ZXXFILE.init();
			
		</script>

