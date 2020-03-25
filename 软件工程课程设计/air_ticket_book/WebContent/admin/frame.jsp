<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--包含导航栏所用的css-start--%>
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/style.css" >
<link rel="stylesheet" href="/air_ticket_book/admin/css/page.css" />
<script type="text/javascript" src="/air_ticket_book/admin/js/jquery.min.js" ></script>

<title>后台管理</title>
</head>
<body>
	<div id="left">
		<div class="bigTitle">机票预订后台管理系统</div>

		<div id="left-menu">
			<div class="sub-left-menu scroll" style="width: 20%;">
				<ul class="nav nav-list">

					<li class="active ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span>航班信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
						<li><a target="frame" href="/air_ticket_book/admin/flight_add.jsp">添加航班信息</a></li>
							<li><a target="frame" href="/air_ticket_book/admin/flight_list.jsp">航班信息列表</a></li>
														
						</ul>
					</li>
					<li class="active ripple"><a class="tree-toggle nav-header"><span
							class="fa-home fa"></span>机票信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
						<li><a target="frame" href="/air_ticket_book/admin/ticket_add.jsp">添加机票信息</a></li>
						<li><a target="frame" href="/air_ticket_book/admin/ticket_information.jsp">查看现有机票信息</a></li>		
						</ul>
					</li>
					<li class="ripple"><a class="tree-toggle nav-header"> <span
							class="fa-diamond fa"></span>订单信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span>
					</a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="/air_ticket_book/admin/order_list.jsp">订单信息列表</a></li>
						</ul>
					</li>
					<li class=" ripple"><a class="tree-toggle nav-header"><span
							class="fa fa-check-square-o"></span>用户信息管理<span
							class="fa-angle-right fa right-arrow text-right"></span> </a>
						<ul class="nav nav-list tree">
							<li><a target="frame" href="/air_ticket_book/admin/user_list.jsp">用户信息列表</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</div>
	
	<div id="right">
		<div id="right_top">
			<div class="leftTiyle" id="flTitle"></div>
			<div class="thisUser">
				当前用户：<%=session.getAttribute("admin_id") %>
				<div class="logout"><a href="/air_ticket_book/admin/logout.jsp">退出</a></div>
			</div>
			
		</div>
		<div id="right_bottom">
			<iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="/air_ticket_book/admin/welcome.jsp"></iframe>
		</div>
	</div>
		
	
<%--包含导航栏所用的js-start--%>
<script src="/air_ticket_book/admin/asset/js/jquery.min.js"></script> 
<script src="/air_ticket_book/admin/asset/js/bootstrap.min.js"></script> 
<script src="/air_ticket_book/admin/asset/js/plugins/jquery.nicescroll.js"></script> 
<script src="/air_ticket_book/admin/asset/js/main.js"></script> 
<%--包含导航栏所用的js-end--%>
</body>
</html>