<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="css/style.css" />


<link href="libs/css/bootstrap.min.css" rel="stylesheet" />
<link href="libs/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
<link href="libs/css/animate.css" rel="stylesheet" />
<link href="libs/css/style.css" rel="stylesheet" />
<link href="libs/css/login.css" rel="stylesheet" />

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<script src="assets/js/ace-extra.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>

<script src="js/jquery-1.9.1.min.js"></script>

<title>登录</title>

<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
	var a = 0;
	function changerimg(o) {
		o.src = "img/img.png?a=" + (a++);
	}
</script>
</head>
<body class="login-layout Reg_log_style">
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="#">返回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<img src="images/logo1.png" />
			</div>
			<div class="space-6"></div>
			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登录
							</h4>
							<div class="login_icon">
								<img src="images/login.png" />
							</div>
							<form class="f2"  method="post">
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input required="required"  name="nike" type="text"
											id="username" title="用户名" /><i>用户名</i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input required="required"  name="password"
											type="password" id="userpwd" title="密码" /><i>密码</i></li>
										<li class="frame_style form_error"><label
											class="Codes_icon"></label><input required="required" name="code" title="验证码" type="text"
											id="Codes_text"/><i>验证码</i>
											<div class="Codes_region">
												<img src="img/img.png" onclick="changerimg(this);">
											</div></li>
									</ul>
									<div class="space"></div>

									<div class="clearfix">
										<button type="button"
											class="width-35 pull-right btn btn-sm btn-primary"
											id="login_btn" class="login_bt">
											<i class="icon-key"></i> 登录
										</button>
									</div>
									<div class="space-4"></div>
								</fieldset>
							</form>
							<div class="social-or-login center">
								<span class="bigger-110">通知</span>
							</div>

							<div class="social-login center">本网站系统不再对IE8以下浏览器支持，请见谅。</div>
						</div>
						<!-- /widget-main -->

						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2016 <a href="">南京思美软件系统有限公司</a>
	</div>
	<strong></strong>
</body>
</html>
<script>
	$(function() {
		$('#login_btn').on(
				'click',
				function() {
					var num = 0;
					var str = "";
					var a =0;
					$("input[type$='text'],input[type$='password']").each(
							function(n) {
								
								if ($(this).val() == "") {
									layer.alert(str += ""
											+ $(this).attr("title")
											+ "不能为空！\r\n", {
										title : '提示框',
										icon : 0,
									});
									num++;
									a=1;
									return false;
								} 
							});
					if(a==0) {
						$.post("login", $(".f2").serialize(),
								function(json) {
									if (json == 1) {
										alert("用户名错误！");
										return;
									} else if (json == 2) {
										alert("密码错误！");
										return;
									} else if (json == -3) {
										alert("验证码错误！");
										window.location.href = "login.jsp";
									} else if (json == 0) {
										window.location.href = "index.jsp";
									}
								}, "json");
						}
				});

		$(document).ready(
				function() {
					$("input[type='text'],input[type='password']").blur(
							function() {
								var $el = $(this);
								var $parent = $el.parent();
								$parent.attr('class', 'frame_style')
										.removeClass(' form_error');
								if ($el.val() == '') {
									$parent.attr('class', 'frame_style')
											.addClass(' form_error');
								}
							});
					$("input[type='text'],input[type='password']").focus(
							function() {
								var $el = $(this);
								var $parent = $el.parent();
								$parent.attr('class', 'frame_style')
										.removeClass(' form_errors');
								if ($el.val() == '') {
									$parent.attr('class', 'frame_style')
											.addClass(' form_errors');
								} else {
									$parent.attr('class', 'frame_style')
											.removeClass(' form_errors');
								}
							});
				})
	});
</script>