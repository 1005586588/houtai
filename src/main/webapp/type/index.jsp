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
        
<title>管理员</title>
<script type="text/javascript">

var	parentid=${requestScope.parentid};

	function del(id) {
		if (confirm("确认删除？")) {
			location.href = "delete?id=" + id+"&parentid="+parentid;
		}
	}

	function fresh() {
		location.href="index?parentid="+parentid;
	}
	function openwin() {
		show("add?parentid="+parentid,400,500);
	}
	function openwin2(id) {
		show("edit?id="+id,400,500);
	}
	function changer(o) {
		$(o).nextAll().remove();
		$.getJSON("gettypelist",{id:(o.value?o.value:0)},function(json){
			if(json.length>0){
				var select=$("<select onchange='changer(this);'></select>");
				for(var i=0;i<json.length;i++){
					select.append($("<option value='"+json[i].id+"'>"+json[i].name+"</option>"));
				}
				$(o).after(select);
				changer(select[0]);
			}
		});
	}
	
	$(function(){
		if($(".myselect").attr("dataid")&&$(".myselect").attr("dataid")>0){
			$.getJSON("getalltype",{id:$(".myselect").attr("dataid")},function(json){
				for(var i=0;i<json.length;i++){
					var select=$("<select onchange='changer(this);'></select>");
					for(var j=0;j<json[i].length;j++){
						if(json[i][j].parent_name=="1"){
							select.append($("<option select='select' value='"+json[i][j].id+"'>"+json[i][j].name+"</option>"));
						}else{
							select.append($("<option  value='"+json[i][j].id+"'>"+json[i][j].name+"</option>"));
						}
					}
					$(".myselect").parent().append(select);
				}
			});
		}else{
			changer($(".myselect")[0]);
		}
	});
	
	
</script>
</head>

<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">

  <!--操作-->
     <div class="border clearfix">
     
       <span class="l_f">
       <div>
       <label>返回上级：</label><label>${requestScope.path}</label>
        <a onclick="openwin()" class="btn btn-warning"><i class="fa fa-plus"></i> 新增</a>
      </div>
       </span>
     </div>
     <!--管理员列表-->
     <div class="h_products_list clearfix" id="products_list">
     
           <table class="table table-striped table-bordered table-hover" id="sample_table">
		<thead>
		 <tr>
				<th width="150px">名称</th>
				<th width="150px">上级名称</th>
				<th width="150px">操作</th>
			</tr>
		</thead>
	<tbody>
	 <c:forEach items="${requestScope.list}" var="r">
     <tr>
    		
								<td>${r.name}</td>
								<td>${r.parent_name}</td>
			
     <td class="td-manage">
        <a onclick="openwin2(${r.id})">修改</a>       
        <a href="javascript:del(${r.id})">删除</a>
        <a href="index?parentid=${r.id}">下级</a>
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
</script>

