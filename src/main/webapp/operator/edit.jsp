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
		<div id="add_administrator_style" class="add_menber" >
		<c:if test="${requestScope.info!=null}">
		<form class="f2" action="update" method="post">
			<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		<c:if test="${requestScope.info==null}">
		<form class="f2" action="insert" method="post">
		</c:if>
		
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>用户名：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="${requestScope.info.nike}"  id="user-tel" name="nike" >
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>密码：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="${requestScope.info.password}"  id="user-tel" name="password" >
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>姓名：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="${requestScope.info.name}"  id="user-tel" name="name" >
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>备注：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="${requestScope.info.comments}"  id="user-tel" name="comments" >
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>电话：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="${requestScope.info.tel}"  id="user-tel" name="tel" >
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>性别：</label>
			<div class="formControls  skin-minimal">
		     <select class="inputselect" name="sex">
				<c:forEach items="${requestScope.sexstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.sex!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.sex==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
				</c:forEach>
			</select> 
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>权限：</label>
			<div class="formControls  skin-minimal">
		<select class="inputselect" name="power">
			<c:forEach items="${requestScope.powerstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.power!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.power==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
			</select> 
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>	
			
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>状态：</label>
			<div class="formControls  skin-minimal">
			<select class="inputselect" name="status">
			<c:forEach items="${requestScope.workstatus}" var="r" varStatus="v">
				<c:if test="${requestScope.info.status!=v.index}">
					<option value="${v.index}">${r}</option>
				</c:if>
				<c:if test="${requestScope.info.status==v.index}">
					<option selected="selected" value="${v.index}">${r}</option>
				</c:if>
			</c:forEach>
			</select> 
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>		
		 
				<button class="seachbt1" type="button" onclick="save();" >保存</button>
		
	</form>
</div>
</body>
</html>