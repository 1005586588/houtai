<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ include file="../model/list_header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
         <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css"/>       
        <link href="../assets/css/codemirror.css" rel="stylesheet">
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
<title>订单</title>
<script type="text/javascript">

var	select=${requestScope.select};
var	txt=${requestScope.txt};

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
	//批量删除**************************************************
	function delall(id) {
		if (confirm("确认全部删除？")) {
			var	ids=[];
			$(".chk").each(function(){
				if($(this).prop("checked")){
					ids.push($(this).attr("myid"));
				}
			});
		if(ids.length==0){
			alert("请选择行");
			return ;
		}
			location.href = "deleteall?ids=" + ids;
		}
	}
	
	function fresh() {
		location.href="index";
	}
	
	function openwin() {
		show("add",400,500);
	}
	
	function openwin2(id) {
		show("edit?id="+id,400,500);
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
			<option value="0">日期查询</option>
			
		</select>
		<select class="inputselect sinput" name="txt" style="height: 30px; display: none;">
			<option value="0">全部显示</option>
			<option value="3">1天内查询</option>
			<option value="2">7天内查询</option>
			<option value="1">30天内查询</option>
			
		</select>
		
			<button class="layui-btn" type="submit">查询</button>
       
        <a href="javascript:ovid()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
     </div>
     <!--管理员列表-->
     <div class="h_products_list clearfix" id="products_list">

      
           <table class="table table-striped table-bordered table-hover" id="sample_table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="250px">日期</th>
				<th width="80px">订单号</th>
				<th width="80px">原总金额</th>
				<th width="80px">实际金额</th>
				<th width="80px">用户名</th>
				<th width="80px">地址</th>
				<th width="80px">评价状态</th>
				<th width="80px">状态</th>
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	 <c:forEach items="${requestScope.list}" var="r">
     <tr>
      <td><label><input type="checkbox" class="ace"><span class="lbl" ></span></label></td>
    		
								<td>${r.date}</td>
								<td>${r.code}</td>
								<td>${r.amount}</td>
								<td>${r.nowamount}</td>
								<td>${r.uname}</td>
								<td>${r.aname}</td>
								<td>${r.assessstatusa}</td>
								<td>${r.sa}</td>
							
			
<!--       <td class="td-status"><span class="label label-success radius">正常</span></td> -->
      <td class="td-manage">
            
      <c:if test="${r.status==1}">
      		<a title="发货"  onclick="member_start(this,${r.id}) "  href="javascript:;"  class="btn btn-xs btn-info" >发货</a>
      </c:if>
      <c:if test="${r.status==4}">
      	<a title="取消"  onclick="member_stop(this,${r.id}) "  href="javascript:;"  class="btn btn-xs btn-info" >取消</a>
      </c:if>
        <a title="删除"   href="" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
       
       </td>
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
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
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

</script>
<script type="text/javascript">
$(function() { 
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
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
 laydate({
    elem: '#start',
    event: 'focus' 
});

/*用户-取消*/
function member_stop(obj,id){
	
		show("updatestatus?status=5&id=" + id,400,500);

}
/*用户-发货*/
function member_start(obj,id){
	
		show("updatestatus?status=2&id=" + id,400,500);

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
/*添加管理员*/
$('#administrator_add').on('click', function(){
	layer.open({
    type: 1,
	title:'添加管理员',
	area: ['700px',''],
	shadeClose: false,
	content: $('#add_administrator_style'),
	
	});
})
	//表单验证提交
$("#form-admin-add").Validform({
		
		 tiptype:2,
	
		callback:function(data){
		//form[0].submit();
		if(data.status==1){ 
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){ 
                    location.reload();//刷新页面 
                    });   
            } 
            else{ 
                layer.msg(data.info, {icon: data.status,time: 3000}); 
            } 		  
			var index =parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}
		
		
	});	
</script>

