
<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.db_conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<%@ include file="verify_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单列表</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class="bg-body">
	<!-- header -->
	<nav class="navbar navbar-default navbar-fixed-top bg-white">
		<nav class="navbar navbar-default"
			style="min-height: 30px; line-height: 30px; margin-bottom: 0px; border-radius: 0;">
			<div class="container font12">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<ul class="nav navbar-nav nav-top-small" style="margin-left: -15px;">
					<li class="dropdown">
						<% if(session.getAttribute("user_id")!=null){ %>
							<a href="javacript:none" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								您好，<%=session.getAttribute("user_id").toString() %>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="logout.jsp">退出</a></li>
							</ul>
						<%}else{ %>
							<a href="../user_center" class="dropdown-toggle"  role="button" aria-haspopup="true" aria-expanded="false">
								请登录！
								
							</a>
						<%} %>
					</li>
				</ul>

			</div>
		</nav>


		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class=" " href="index.jsp"><img src="images/logo.png"
					width="210" height="70" alt="系统LOGO" class="pull-left mar-right-30"
					style="margin-left: -15px;"></a>

			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.jsp"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i>首页</a></li>
					<li><a href="/air_ticket_book/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

				</ul>
			</div>

		</div>
	</nav>
	<!-- header end -->





	<!-- list start -->
	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 120px;">
		<table
			class="table table-hover table-striped font12 table-bordered v-align-top">
			<tr>
				<th style="width:10%;">航班号</th>
				<th style="width:15%;">乘机人</th>
				<th style="width:18%;">乘机日期</th>
				<th style="width:10%;">舱位</th>
				<th style="width:17%;">乘客证件</th>
				<th style="width:15%;">联系人</th>
				<th style="width:15%;">联系电话</th>
			</tr>
			
			<%
				db_conn conn=new db_conn();
				String user_id=session.getAttribute("user_id").toString();
				String sql="select * from t_order where order_user='"+user_id+"'";
				ResultSet res=conn.executeQuery(sql);
				while(res.next()){
					
			%>
			
			<tr>
				<td>
					<%=res.getString(3) %> 
				</td>
				<td><p><%=res.getString(4) %></p></td>
				<td><%=res.getString(5) %></td>
				<td><%=res.getString(6) %></td>
				<td><%=res.getString(7) %></td>
				<td><%=res.getString(8) %></td>
				<td><%=res.getString(9) %></td>
				
			</tr>
			
			<%
				}
			%>

		</table>
	</div>

	<!-- list end -->
</body>
</html>