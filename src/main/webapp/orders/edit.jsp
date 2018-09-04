<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../libs/css/edit.css">
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
<script type="text/javascript" src="../libs/js/jquery.min.js"></script>
<script type="text/javascript">
function save() {
	$.post($(".f2").attr("action"),$(".f2").serialize(),function(json){
		if(json.status>0){
		parent.fresh();
		var	index=parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}else{
		alert(json.text);
	}
	},"json");
}
</script>
</head>
<body>
		<c:if test="${requestScope.info.status==1}">
		<form class="f2" action="insert" method="post">
		<input type="hidden" class="input-text" value="2" name="status">
		
				<input type="hidden" class="input-text" value="${requestScope.info.id}" name="orders_id" >
				<input type="hidden" class="input-text" value="${requestScope.info.id}" name="id" >
				<input type="hidden" class="input-text" value="${requestScope.date}" name="date">
			
				<input type="hidden" class="input-text" value="${requestScope.info.status+1}"  id="user-tel" name="dest_status">
			
		<div class="form-group" style="margin-top: 20px;">
			<label class="form-label "><span class="c-red">*</span>运单号：</label>
			<div class="formControls ">
				<input type="text" class="input-text"  name="info">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
	
				<input type="hidden" class="input-text" value="${requestScope.info.amount}"   name="amount" >
				<input type="hidden" class="input-text" value="${requestScope.info.user_id}"  name="num">
			
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>快递公司：</label>
			<div class="formControls ">
				<input type="text" class="input-text"  name="comments">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		</form>
		 </c:if>
		 
		 
		 <c:if test="${requestScope.info.status==4}">
		<form class="f2" action="insert" method="post">
					
				<input type="hidden" class="input-text" value="${requestScope.info.id+1}"  id="user-tel" name="orders_id" >
			
				<input type="hidden" class="input-text" value="${requestScope.date}" name="date">

				<input type="hidden" class="input-text" value="5" name="status">
				<input type="hidden" class="input-text" value="${requestScope.info.status}"  id="user-tel" name="dest_status" >
			
		<div class="form-group" style="margin-top: 30px;">
			<label class="form-label "><span class="c-red">*</span>取消原因：</label>
			<div class="formControls ">
				<textarea type="text" class="input-text" name="info"></textarea>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
				<input type="hidden" class="input-text" value="${requestScope.info.amount}"  id="user-tel" name="amount" >
				<input type="hidden" class="input-text" value="${requestScope.info.user_id}"  id="user-tel" name="num" >
				<input type="hidden" class="input-text" value="${requestScope.info.comments}"  id="user-tel" name="comments" >
			</form>
		 </c:if>
		 
				<button class="seachbt1" type="button" onclick="save();" >保存</button>
		
	
</body>
</html>