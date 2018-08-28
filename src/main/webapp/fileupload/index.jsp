<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/piclist.js">
</script>

</head>
<body>

<form action="a">

<div class="picList" name="fileurl"  width="300"  height="200+" rows="2" cols="5" >
<!-- <item url="/day6-upload/uploadFile/1533803182553.png" > -->
<!-- <item url="/day6-upload/uploadFile/1533803172528.png" > -->
<!-- <item url="/day6-upload/uploadFile/1533803176878.png" > -->
</div>



<input type="submit" value="保存">
</form>


${sessionScope.picurl}
<form action='upload' method='post' enctype='multipart/form-data' >
<input type='file'  name='file'>
<button type="submit">上传</button>
</form>
</body>
</html>