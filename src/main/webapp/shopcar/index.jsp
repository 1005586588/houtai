<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ include file="../model/list_header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css"/>       
        <link href="../assets/css/codemirror.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/ace.min.css" />
        <link rel="stylesheet" href="../font/css/font-awesome.min.css" />
		<script src="../js/jquery-1.9.1.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="../assets/js/typeahead-bs2.min.js"></script>           	
		<script src="../assets/js/jquery.dataTables.min.js"></script>
		<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="../assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="../js/lrtk.js" type="text/javascript" ></script>
        <script src="../assets/layer/layer.js" type="text/javascript"></script>	
        <script src="../assets/laydate/laydate.js" type="text/javascript"></script>
<style>
.h_products_list {
overflow:scroll !important;
}
</style>       
<title>购物车</title>
<script type="text/javascript">

var	select=${requestScope.select};
var	txt="${requestScope.txt}";

	//全部选择多选按钮******************************************
	$(function () {
	
	//下拉框选择	查询****************************************
	$(".sselect").on("change",function(){
		$(".sinput").css("display","none").prop("disabled","disabled");
		$($(".sinput")[$(".sselect").val()]).css("display","inline").removeAttr("disabled");
	});
	
	$(".sselect").val(select);
	$(".sinput").css("display","none").prop("disabled","disabled");
	$($(".sinput")[select]).css("display","inline").removeAttr("disabled").val(txt);
	
});
	
	function fresh() {
		location.href="index";
	}
	function openwin(id) {
		show("show?id="+id,900,600);
	}
	
	
</script>
</head>
<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <!--操作-->
     <div class="border clearfix">
       <span class="l_f">
       <form action="index" method="post">
			<select	class="sselect" name="select">
			<option value="0">商品名称查询</option>
			<option	value="1">用户名称查询</option>
		</select>
		<input name="txt" class="sinput" />
		<select class="inputselect sinput" name="txt" style="height: 30px; display: none;">
			<c:forEach items="${requestScope.typerow2}" var="q">
				<c:if test="${requestScope.info.user_id!=q.id}">
					<option value="${q.id}">${q.email}</option>
				</c:if>
				<c:if test="${requestScope.info.user_id==q.id}">
					<option selected="selected" value="${q.id}">${q.email}</option>
				</c:if>
			</c:forEach>
		</select>
			<button class="layui-btn" type="submit">查询</button>
			</form>
       </span>
     </div>
     <!--管理员列表-->
     <div class="h_products_list clearfix" id="products_list">
      
           <table class="table table-striped table-bordered table-hover" id="sample_table">
		<thead>
		 <tr>
				<th width="250px">用户名</th>
				<th width="80px">商品名</th>
				<th width="80px">数量</th>
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	 <c:forEach items="${requestScope.list}" var="r">
     <tr>
								<td>${r.uname}</td>
								<td>${r.pname}</td>
								<td>${r.count}</td>
			
<!--       <td class="td-status"><span class="label label-success radius">正常</span></td> -->
<!--       <td class="td-manage"> -->
<%--         <a title="编辑"  onclick="javascript:openwin2(${r.id})"  href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>        --%>
<!--        </td> -->

      <td class="td-manage">
      	      <a title="查看商品详情"  onclick="openwin(${r.product_id});"  href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>       
       </td>

     </tr>
     </c:forEach>
    </tbody>
    </table>
    
    
    	<div class="layui-table-page">
			<div id="layui-table-page1">
				<div class="layui-box layui-laypage layui-laypage-default">
					<span class="layui-laypage-skip"> 
					<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.search.prev}'">上一页</button>
						<button type="button" class="layui-laypage-btn" onclick="location.href='index?pageno=${requestScope.search.next}'">下一页</button>
					</span>
				</div>
			</div>
		</div>
		
      </div>
     </div>
  </div>
</div>

</body>
</html>

<script type="text/javascript">

//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})

</script>

