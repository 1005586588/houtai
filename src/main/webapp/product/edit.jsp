<%@page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../fileupload/js/jquery-3.3.1.min.js"></script>
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
		 <script type="text/javascript" charset="utf-8" src="../uedit/ueditor.config.js"></script>
 	     <script type="text/javascript" charset="utf-8" src="../uedit/ueditor.all.min.js"> </script>
   		 <script type="text/javascript" charset="utf-8" src="../uedit/lang/zh-cn/zh-cn.js"></script>  	
        <script type="text/javascript" src="../fileupload/js/piclist.js"></script>
<script type="text/javascript">
	function save() {
		var pics='';
		$("input[name='pics']").each(function(j,item){
			if(item.value != '')
		     pics +=item.value+",";
		});
		if(pics !=''){
			pics=pics.substring(0,pics.length-1);
		}
		
		$.post($(".f2").attr("action")+"?pics="+pics, $(".f2").serialize(), function(json) {
			if (json.status > 0) {
				parent.fresh();
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} else {
				alert(json.text);
			}
		}, "json");
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
							select.append($("<option selected='selected' value='"+json[i][j].id+"'>"+json[i][j].name+"</option>"));
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

	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>图片：</label>
		<div class="formControls  skin-minimal">
			<div class="picList" name="pics"  width="300"  height="200+" rows="2" cols="5" >
				<c:forEach items="${requestScope.info.piclist}" var="p">
				<item url="${p}" >
				</c:forEach>
			</div>
			
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>


	<div id="add_administrator_style1" class="add_menber">
	
		<c:if test="${requestScope.info==null}">
			<form class="f2" action="insert" method="post">
		</c:if>
		<c:if test="${requestScope.info!=null}">
			<form class="f2" action="update" method="post">
				<input type="hidden" name="id" value="${requestScope.info.id}">
		</c:if>
		
		<div class="form-group" >
			<label class="form-label "><span class="c-red">*</span>商品类型：</label>
			<div class="formControls  skin-minimal"  style=" width: 600px ">
				<b class="myselect" style="display: none" dataid="${requestScope.info.type_id}"></b>
				
				<input type="hidden" class="input-text" 
					value="${requestScope.info.type_id}"  name="type_id">
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>商品全名：</label>
			<div class="formControls " >
				<input type="text" class="input-text"  style=" width: 800px "
					value="${requestScope.info.fullname}" id="user-tel" name="fullname">
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>活动：</label>
			<div class="formControls ">
				<input type="text" class="input-text"
					value="${requestScope.info.activity}" id="user-tel" name="activity">
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>
		
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>提示信息：</label>
			<div class="formControls ">
				<input type="text" class="input-text"
					value="${requestScope.info.tip}" id="user-tel" name=tip>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>促销信息：</label>
			<div class="formControls ">
				<input type="text" class="input-text"
					value="${requestScope.info.sale}" id="user-tel" name="sale">
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>原价格：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.price}" id="user-tel" name="price">
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>现价格：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.nowprice}" id="user-tel" name="nowprice"
				datatype="m" nullmsg="手机不能为空">
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>销售数量：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.salecount}" name="salecount">
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>收藏人数：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.collectcount}" name="collectcount">
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>优先级：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.priority}" id="user-tel" name="priority">
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>状态：</label>
		<div class="formControls  skin-minimal">
			<select class="inputselect" name="status">
				<c:forEach items="${requestScope.productstatus}" var="r"
					varStatus="v">
					<c:if test="${requestScope.info.status!=v.index}">
						<option value="${v.index}">${r}</option>
					</c:if>
					<c:if test="${requestScope.info.status==v.index}">
						<option selected="selected" value="${v.index}">${r}</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	
	
	<div class="form-group">
		<label class="form-label "><span class="c-red">*</span>备注：</label>
		<div class="formControls ">
			<input type="text" class="input-text"
				value="${requestScope.info.comments}" id="user-tel" name="comments" >
		</div>
		<div class="col-4">
			<span class="Validform_checktip"></span>
		</div>
	</div>
	
	
	
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>详情：</label>
			<div class="formControls ">
			  <script id="editor" type="text/plain"   style="width:800px;height:350px;"></script>
			</div>
			<div class="col-4">
				<span class="Validform_checktip"></span>
			</div>
		</div>

	
	
	</div>
	


	<button class="seachbt1" type="button" onclick="save();">保存</button>


	</form>
	
	<script type="text/javascript">
	 var ue = UE.getEditor('editor');
	 ue.ready(function() {
		    ue.setContent("${requestScope.info.info}");
		});
	</script>
</body>
</html>