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
<link rel="stylesheet" href="../css/style.css" />
<link href="../assets/css/codemirror.css" rel="stylesheet" />
<link rel="stylesheet" href="../assets/css/ace.min.css" />
<link rel="stylesheet" href="../font/css/font-awesome.min.css" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../Widget/Validform/5.3.2/Validform.min.js"></script>
<script src="../assets/js/typeahead-bs2.min.js"></script>
<script src="../assets/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../assets/layer/layer.js" type="text/javascript"></script>
<script src="../js/lrtk.js" type="text/javascript"></script>
<script src="../assets/layer/layer.js" type="text/javascript"></script>
<script src="../assets/laydate/laydate.js" type="text/javascript"></script>
<style>
.h_products_list {
	overflow: scroll !important;
}
</style>
<title>管理员</title>
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
	function openwin() {
		show("add",700,350);
	}
	function openwin2(id) {
		show("edit?id="+id,700,350);
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
							<select class="sselect" name="select">
								<option value="0">用户名查询</option>
								<option value="1">权限查询</option>
							</select> <input name="txt" class="sinput" /> <select
								class="inputselect sinput" name="txt"
								style="height: 30px; display: none;">
								<c:forEach items="${requestScope.powerstatus}" var="r"
									varStatus="v">
									<c:if test="${requestScope.info.power!=v.index}">
										<option value="${v.index}">${r}</option>
									</c:if>
									<c:if test="${requestScope.info.power==v.index}">
										<option selected="selected" value="${v.index}">${r}</option>
									</c:if>
								</c:forEach>
							</select>
							<button class="layui-btn" type="submit">查询</button>

							<a onclick="openwin()" class="btn btn-warning"><i
								class="fa fa-plus"></i> 添加管理员</a>
					</span>
				</div>
				<!--管理员列表-->
				<div class="h_products_list clearfix" id="products_list">

					<table class="table table-striped table-bordered table-hover"
						id="sample_table">
						<thead>
							<tr>
								<th width="250px">用户名</th>
								<th width="100px">姓名</th>
								<th width="100px">性别</th>
								<th width="80px">电话</th>
								<th width="130px">权限</th>
								<th width="180px">备注</th>
								<th width="90px">状态</th>
								<th width="200px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.list}" var="r">
								<tr>
									<td>${r.nike}</td>
									<td>${r.name}</td>
									<td>${r.sexa}</td>
									<td>${r.tel}</td>
									<td>${r.powera}</td>
									<td>${r.comments}</td>

									<!--       <td class="td-status"><span class="label label-success radius">正常</span></td> -->

									<c:if test="${r.status==0}">
										<td class="td-status"><span
											class="label label-success radius">${r.statusa}</span></td>
									</c:if>
									<c:if test="${r.status==1}">
										<td class="td-status"><span
											class="label label-defaunt radius ">${r.statusa}</span></td>
									</c:if>

									<td class="td-manage"><c:if test="${r.status==0}">
											<a onclick="member_stop(this,${r.id}) " href="javascript:;"
												title="${r.statusa}" class="btn btn-xs btn-success"><i
												class="fa fa-check  bigger-120"></i></a>
										</c:if> <c:if test="${r.status==1}">
											<a onclick="member_start(this,${r.id}) " href="javascript:;"
												title="${r.statusa}" class="btn btn-xs "><i
												class="fa fa-close  bigger-120"></i></a>
										</c:if> <a title="编辑" onclick="javascript:openwin2(${r.id})"
										href="javascript:;" class="btn btn-xs btn-info"><i
											class="fa fa-edit bigger-120"></i></a> </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="layui-table-page">
						<div id="layui-table-page1">
							<div class="layui-box layui-laypage layui-laypage-default">
								<span class="layui-laypage-skip">
									<button type="button" class="layui-laypage-btn"
										onclick="location.href='index?pageno=${requestScope.search.prev}'">上一页</button>
									<button type="button" class="layui-laypage-btn"
										onclick="location.href='index?pageno=${requestScope.search.next}'">下一页</button>
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

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认离职吗？',function(index){
			location.href = "updatestatus?status=1&id=" + id;
			layer.msg('已离职!',{icon: 5,time:1000});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认正常吗？',function(index){
			location.href = "updatestatus?status=0&id=" + id;
	 		layer.msg('已正常!',{icon: 6,time:1000});
	});
}

/*产品-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*产品-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script>

