<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订后台管理系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<style>
.center {
	text-align: center;
}
.p2 {
	font-size: 20px;
	font-family: 微软雅黑 Light;
}

body {
	background: url(images/background.jpg) no-repeat center 0px;
	background-position: center 0;
	background-size: cover;
}
</style>
<script>
	function isValid() {
		if (nameform.id.value == "") {
			window.alert("您必须完成帐号的输入!");
			nameform.id.focus();
			return false;
		}

		if (nameform.password.value == "") {
			window.alert("您必须完成密码的输入!");
			nameform.password.focus();
			return false;
		}
	}
</script>

<body>
	<p class="p2"><b>机票预订后台管理系统</b><br/></p>
	<div class="center">
	<div class="index-wall white " style="">
		<div style="margin-top:150px;">
			<form action="../login" method=post name="nameform"
				onSubmit="return isValid(this);">
				<p class="p2">
					<b>用户名：</b><input type="text" name="id" value="" size="30"
						maxlength="20">
				</p>
				<p class="p2">
					<b>密&nbsp;&nbsp;码：</b><input type="password" name="password" value=""
						size="30" maxlength="20"><br />
					<br />
				</p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name=b1 type="submit" value="登录" style='font-size:20px'/>&nbsp;&nbsp;&nbsp; 
			</form>
		</div>
	</div>
	</div>
	
</body>
</html>



