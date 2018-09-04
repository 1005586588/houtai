<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ include file="../model/list_header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../font/css/font-awesome.min.css" />
	<link rel="stylesheet" href="../assets/css/ace.min.css" />
	<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="../Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
	<link href="../Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/codemirror.css" rel="stylesheet" />
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/typeahead-bs2.min.js"></script>
	<script src="../assets/js/jquery.dataTables.min.js"></script>
	<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="../js/H-ui.js"></script>
	<script type="text/javascript" src="../js/H-ui.admin.js"></script>
	<script src="../assets/layer/layer.js" type="text/javascript"></script>
	<script src="../assets/laydate/laydate.js" type="text/javascript"></script>
	<script type="text/javascript" src="../Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
	<script src="../js/lrtk.js" type="text/javascript"></script>
	<script src="../assets/js/typeahead-bs2.min.js"></script>

<style>
	.h_products_list {
	overflow: auto !important;
	}
</style>

<title>产品列表</title> 
<script type="text/javascript">
var	select=${requestScope.select};
var	txt="${requestScope.txt}";

	function del(id) {
		if (confirm("确认删除？")) {
			location.href = "delete?id=" + id;
		}
	}
	//全部选择多选按钮******************************************
	$(function () {
		$(".selectall").on("click",function(){
			if(event.target.checked)
			$(".chk").prop("checked","checked");
			else {
				$(".chk").prop("checked","");
			}
		});

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
		show("add",950,600,1);
	}
	function openwin2(id) {
		show("edit?id="+id,950,600,1);
	}
</script>
</head>
<body>
	<div class=" page-content clearfix">
		<div class="administrator">
			<div id="products_style">
				<div class="border clearfix">
					<span class="l_f">
						<form action="index" method="post">
							<select class="sselect" name="select">
								<option value="0">商品全名查询</option>
								<option value="1">商品类型查询</option>
							</select> <input name="txt" class="sinput" /> <select
								class="inputselect sinput" name="txt"
								style="height: 30px; display: none;">
									<c:forEach items="${requestScope.typerow}" var="q">
										<c:if test="${requestScope.info.type_id!=q.id}">
											<option value="${q.id}">${q.name}</option>
										</c:if>
										<c:if test="${requestScope.info.type_id==q.id}">
											<option selected="selected" value="${q.id}">${q.name}</option>
										</c:if>
									</c:forEach>
							</select>
								<button class="layui-btn" type="submit">查询</button> <a
								onclick="openwin()" class="btn btn-warning" ><i
									class="fa fa-plus"></i> 添加新商品</a>
					</span>
				</div>
				<!--产品列表展示-->
				<div class="h_products_list clearfix" id="products_list" style="height: 550px;">

					<table class="table table-striped table-bordered table-hover" 
						id="sample-table">
						<thead>
							<tr>
								<th width="80px">商品类型</th>
								<th width="250px">商品全名</th>
								<th width="80px">图片</th>
								<th width="80px">活动</th>
								<th width="80px">提示信息</th>
								<th width="80px">促销信息</th>
								<th width="60px">原价格</th>
								<th width="60px">现价格</th>
								<th width="50px">销售数量</th>
								<th width="50px">收藏人数</th>
								<th width="30px">优先级</th>
								<th width="70px">备注</th>
								<th width="80px">状态</th>
								<th width="200px">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.list}" var="r">
								<tr>
									<td>${r.tname}</td>
									<td>${r.fullname}</td>
									<td>
									<c:if test="${r.pics!=null}">
									<img src="${r.pics}" width="60" height="90" />
									</c:if>
									</td>
									<td>${r.activity}</td>
									<td>${r.tip}</td>
									<td>${r.sale}</td>
									<td>${r.price}</td>
									<td>${r.nowprice}</td>
									<td>${r.salecount}</td>
									<td>${r.collectcount}</td>
									<td>${r.priority}</td>
									<td>${r.comments}</td>


									<c:if test="${r.status==0}">
										<td class="td-status"><span
											class="label label-success radius">${r.proa}</span></td>
									</c:if>
									<c:if test="${r.status==1}">
										<td class="td-status"><span
											class="label label-defaunt radius">${r.proa}</span></td>
									</c:if>


									<td class="td-manage"><c:if test="${r.status==0}">
											<a onclick="member_stop(this,${r.id})" title="禁用"
												class="btn btn-xs btn-success"><i
												class="icon-ok bigger-120"></i></a>
										</c:if> <c:if test="${r.status==1}">
											<a onclick="member_start(this,${r.id})" title="启用"
												class="btn btn-xs"><i class="fa fa-close  bigger-120"></i></a>
										</c:if> <a title="编辑" onclick="javascript:openwin2(${r.id})"
										href="javascript:;" class="btn btn-xs btn-info"><i
											class="fa fa-edit bigger-120"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});

$(function() { 
	$("#products_style").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:260,//设置显示时间距
	});
});
</script>
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

/*产品-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		location.href = "updatestatus?status=1&id=" + id;
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*产品-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		location.href = "updatestatus?status=0&id=" + id;
		layer.msg('已启用!',{icon: 6,time:1000});
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
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form').on('click', function(){
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
</script>
