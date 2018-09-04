<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="assets/css/codemirror.css" rel="stylesheet" />
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/jquery.min.js"></script>        
        <script src="assets/dist/echarts.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>            
        <title></title>
        </head>		
<body>
<div class="page-content clearfix">
 <div class="alert alert-block alert-success">
  <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
  <i class="icon-ok green"></i>欢迎使用<strong class="green">后台管理系统<small>(v1.2)</small></strong>,你本次登录时间为2016年7月12日13时34分，登录IP:192.168.1.110.	
 </div>
 
 <!--记录-->
 <div class="clearfix">
  <div class="home_btn">
     <div>
     <a href="product/index"  title="添加商品" class="btn  btn-info btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/icon-addp.png" /></i>
     <h5 class="margin-top">添加商品</h5>
     </a>
     <a href="type/index"  title="产品分类" class="btn  btn-primary btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/icon-cpgl.png" /></i>
     <h5 class="margin-top">产品分类</h5>
     </a>
 	 <a href="shopcar/index"  title="购物车" class="btn  btn-purple btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/icon-gwcc.png" /></i>
     <h5 class="margin-top">购物车</h5>
     </a>
     <a href="orders/index" title="商品订单" class="btn  btn-info btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/icon-addwz.png" /></i>
     <h5 class="margin-top">商品订单</h5>
     </a>
     <a href="operator/index" title="管理员设置" class="btn  btn-info btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/xtsz.png"></i>
     <h5 class="margin-top">管理员设置</h5>
     </a>
     <a href="operator/info?id=${sessionScope.operator.id}"  title="个人信息" class="btn  btn-success btn-sm no-radius" style="width: 100px;">
     <i class="bigger-200"><img src="images/icon-grxx.png" /></i>
     <h5 class="margin-top">个人信息</h5>
     </a>
     
     </div>
  </div>
 
 </div>
   
     </div>
</body>
</html>
<script type="text/javascript">
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.no-radius').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
     $(document).ready(function(){
		 
		  $(".t_Record").width($(window).width()-640);
		  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		 $(".t_Record").width($(window).width()-640);
		});
 });
	 
	 
 </script>   