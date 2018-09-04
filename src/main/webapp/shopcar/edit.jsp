<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="../fileupload/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../fileupload/css/font-awesome.min.css">
<link rel="stylesheet" href="../libs/css/edit.css">
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/style.css" />
<link href="../assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/ace.min.css" />
<link rel="stylesheet" href="../font/css/font-awesome.min.css" />
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../Widget/Validform/5.3.2/Validform.min.js"></script>
<script src="../assets/js/typeahead-bs2.min.js"></script>
<script src="../assets/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="../assets/layer/layer.js" type="text/javascript"></script>
<script src="../js/lrtk.js" type="text/javascript"></script>
<script src="../assets/layer/layer.js" type="text/javascript"></script>
<script src="../assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="../libs/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../uedit/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../uedit/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="../uedit/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../fileupload/js/piclist.js"></script>
<script type="text/javascript">
	function close() {
		var index = parent.layer.getFrameIndex(window.name);
		arent.layer.close(index);
	}
</script>
</head>
<body>

	<div class="form-group" style="margin-left: 100px;">
		<label class="form-label "><span class="c-red">*</span>商品图片：</label>
		<div class="formControls  skin-minimal">
				<img src="${requestScope.productlist.pics}" width="60" height="90" />
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>


	<div id="add_administrator_style1" class="add_menber">

		<div class="form-group" style="margin-left: 100px;">
			<label class="form-label "><span class="c-red">*</span>商品全名：</label>
				<span style="width: 600px;">${requestScope.productlist.fullname}</span>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group" style="margin-left: 100px;">
			<label class="form-label "><span class="c-red">*</span>活动：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.activity}</span>
			</div>
			<label class="form-label "><span class="c-red">*</span>提示信息：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.tip}</span>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group" style="margin-left: 100px;">
			<label class="form-label "><span class="c-red">*</span>促销信息：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.sale}</span>

			</div>
			<label class="form-label "><span class="c-red">*</span>优先级：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.priority}</span>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group" style="margin-left: 100px;">
			<label class="form-label "><span class="c-red">*</span>原价格：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.price}</span>
			</div>
			<label class="form-label "><span class="c-red">*</span>现价格：</label>
			<div class="formControls ">
				<span>${requestScope.productlist.nowprice}</span>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>


		<div class="form-group" style="margin-left: 100px;">
			<label class="form-label "><span class="c-red">*</span>销售数量：</label>
			<div class="formControls ">
					<span>${requestScope.productlist.salecount}</span>
			</div>
			<label class="form-label "><span class="c-red">*</span>收藏人数：</label>
			<div class="formControls ">
					<span>${requestScope.productlist.collectcount}</span>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>详情：</label>
			<div class="formControls ">
				${requestScope.productlist.info}
			</div>
		</div>

	</div>

	<button class="seachbt1" type="button" onclick="close();">关闭</button>
	
</body>
</html>