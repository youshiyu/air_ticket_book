<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.db_conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../default/css/bootstrap.min.css" rel="stylesheet">
<link href="../default/css/common.css" rel="stylesheet">
<link href="../default/css/corptravel.css" rel="stylesheet">
<title>机票打印</title>
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/icon.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/home.css">
</head>
<body>

	<div class="ydc-column ydc-column-8">
		<div class="ydc-release-content">
			<div class="ydc-tabPanel ydc-tabPanel-release">
				<div class="ydc-release-tab-head">
					<ul>
						<li class="hit">机票打印</li>
					</ul>
				</div>
				
				<div class="ydc-reg-form-group clearfix" style="margin-top: 30px;">
					<label>请输入机票号:</label>
					<div class="ydc-reg-form-input">
						<input type="t_id" id="user4"
							class="ydc-form-control" autocomplete="off">
					</div>
				</div>							

				</div>
				<form action="/air_ticket_book/index/order_print.jsp" enctype="multipart/form-data" method="post">
					<div class="ydc-reg-form-group">
						<div class="ydc-reg-form-button" style="margin-left: 255px;">
								<input type="submit" value="点击打印">
						</div>
					</div>
				</form>

				
		</div>		
	</div>
</div>




</body>
</html>