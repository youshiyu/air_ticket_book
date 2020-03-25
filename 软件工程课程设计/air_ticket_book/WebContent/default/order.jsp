<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<jsp:useBean id="img_url" class="javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>
<%
	//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
session.setAttribute("p_tel",session.getAttribute("user_id"));
session.setAttribute("f",request.getParameter("flight_id"));
%>
<%! 
    String user_name;
	String flight_id=null;
	String grade=null;
	String grade_character=null;
	String s_p=null;//起飞地点
	String e_p=null;//到达地点
	String s_a=null;//起飞机场
	String e_a=null;//目的机场
	String t_t=null;//起飞时间
	String l_t=null;//到达时间
	
%>
<%
	flight_id=request.getParameter("flight_id");

	if(flight_id==null){
		flight_id="SU2312";
	}
%>
<%
	
db_conn conn=new db_conn();
String sql="select * from flight where f_n='"+flight_id+"'";
ResultSet res=conn.executeQuery(sql);

if(res.next()){	
	s_p=res.getString(2);
	e_p=res.getString(3);
	s_a=res.getString(4);
	e_a=res.getString(5);
	t_t=res.getString(6);
	l_t=res.getString(7);
}


%>


<%@ include file="verify_login.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>订单</title>
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
						<% if(session.getAttribute("user_id")!=null){ 
							String sql2="select * from p_inf where p_tel='"+session.getAttribute("user_id")+"'";
							ResultSet res2=conn.executeQuery(sql2);
							if(res2.next())
							  user_name=res2.getString(2);
						%>
							<a href="javacript:none" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								您好，<%= user_name %>
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
				<a class=" " href="index.jsp"><img src="images/newlogo.png"
					width="350" height="70" alt="系统LOGO" class="pull-left mar-right-30"
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
	
	
	
	
	
	<!-- 订购栏  content start -->

	<form action="../add_order" method="post" >
	<%-- <input type="hidden" name="flight_id" value="<%=flight_id %>"> --%>
	<div class="container  box-shadow mar-bottom-30  "
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 200px;">
		
		<div class="col-sm-7 container bg-white  pad-bottom-20"
			style="margin-top: 30px; margin-bottom: 30px;">

			<div style="overflow: hidden;">
				<h4 class="mar-bottom-90" style="display: block; float: left;margin-top: 20px;">订票日期：</h4>
			</div>
			<div  class="mar-top-10">
					<input name="date" type="text"
						class="ydc-form-control" value="例：2017-03-06" autocomplete="off">
			</div>
			
			<div style="overflow: hidden;">
				<h4 class="mar-bottom-90" style="display: block; float: left; margin-top: 40px;">本人及关联旅客信息：</h4>
			</div>
			
				<div class="container bg-white-eee  mar-bottom-250"
				style=" padding-left: 0px; padding-right:600px;margin-top: 10px; ">
				<table 
					class="table table-hover table-striped ">
					<tr>
						<th style="width:3%;">姓名</th>
						<th style="width:5%;">身份证号</th>
						<th style="width:3%;">电话</th>		
						<th style="width:3%;">是否订购</th>				
					</tr>
					
					<%
					    int i=0;
						db_conn conn2=new db_conn();
						String user_id=session.getAttribute("user_id").toString();
						String sql2="select * from p_inf where p_id in "+
								"(select p_id2 from ptp where p_id in "+
								"(select p_id from p_inf where p_tel='"+user_id+"'))";
						ResultSet res2=conn2.executeQuery(sql2);
						while(res2.next()){
							
					%>
					
					<tr>
						<td><%=res2.getString(2) %></td>
						<td><%=res2.getString(1) %></td>
						<td><%=res2.getString(3) %></td>
						<td><input type="checkbox" name="choose" id="choose" value="1" /></td>  
					</tr>
					
					<%}
					%>
		
				</table>
			</div>


			<!-- 航班信息  -->

       
		</div>
		<div class="col-sm-5 " >
			<div style="margin-left: -15px;margin-top: 110px; ">
				<h3 style="overflow: hidden; margin-left: 0px;">
					<span style="display: block; float: left;"></span>
					<span style="display: block; float: left; margin-left: 190px;"><%=s_p %>-<%=e_p %></span>
					<span
						style="display: block; float: right; color: #999; font-size: 14px; margin-right: 5px;"></span>
				</h3>
			</div>
			<div style=" margin-bottom: 15px; ">
				<div class="flight-from " style="float:left;">
					<span class="time text-center"><%=t_t %></span><br /> <span
						class="text-center"><%=s_a %></span>
				</div>
				<div class="flight-info " style="float: left; margin-left: 70px;">
					<img src="images/a.png"> <span class="font12 gray-999">------</span>
					<img src="images/b.png"><br /> <img src="images/c.png" class="mar-left-30 "> <span
						class="text-center font12  ">乘坐<%=flight_id %></span><br /> <span
						class="airline-direct"></span> <span class="arrow "></span>
				</div>
				<div class="flight-to" style="float: right;">
					<span class="time text-center"><%=l_t %></span><br /> <span
						class="text-center"><%=e_a %></span>
				</div>
			</div>

		</div>

	</div>

	<div class="text-center mar-top-10" style="margin-bottom: 20px;">
			<input type="submit" value="提交订单" class="btn btn-default btn-lg">
	</div>
	</form>

</body>
</html>