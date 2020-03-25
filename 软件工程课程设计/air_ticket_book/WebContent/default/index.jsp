<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page contentType="text/html; charset=UTF-8" import="java.util.Date"%>
<%@page contentType="text/html; charset=UTF-8" import="java.text.SimpleDateFormat"%> 

<%
//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="icon" href="./images/airplane.ico">
<title>机票预订系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<%! String user_name,seat; 
 /*Date date = new Date();
//设置要获取到什么样的时间
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//获取String类型的时间
  String todaydate = sdf.format(date);*/
//也可以用这个  
// String datetime = tempDate.format(new Date(System.currentTimeMillis()));
	String todaydate="2019-12-01";
	//注意原本的设定是每天的机票都是不同的，因此数据库中要有每天不同的机票，这里为了方便，就设置了一个固定的时间
%> 


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
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					    <span class="icon-bar"></span>
					</button>
				</div>
				<ul class="nav navbar-nav nav-top-small" style="margin-left: -15px;">
					<li class="dropdown">
						<% if(session.getAttribute("user_id")!=null){ 
							db_conn conn=new db_conn();
							String sql="select * from p_inf where p_tel='"+session.getAttribute("user_id")+"'";
							ResultSet res=conn.executeQuery(sql);
							if(res.next())
							  user_name=res.getString(2);
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
								点击此处登录（登录后可以订购机票）
								
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
					<li class="active"><a href="javascript:none"><i
							class="icon iconfont icon-nav-block font24">&#xe620;</i> 首页</a></li>
					<li><a href="/air_ticket_book/user_center"><i
							class="icon iconfont icon-nav-block font24">&#xe61c;</i> 用户中心</a></li>

				</ul>
			</div>

		</div>
	</nav>
	<!-- header end -->
	<!-- 搜索 -->
	<div class="index-wall white " style="">
		<div class="container"
			style="position: relative; margin-left: 650px; width: auto;">
			<form class="form-inline" action="/air_ticket_book/search" method="post">
				<!-- <div class="form-group mar-left-10" >
					<label for="" >购买机票时间：<%=todaydate %></label>
				</div> -->
				<div class="form-group mar-left-10" >
					<label for="" >出发城市</label>
					 <input name="departure" type="text" class="form-control"
						style="width: 85px;"  value="" placeholder="出发城市">
				</div>
				<div class="form-group">
					<label for="">  &nbsp;&nbsp;&nbsp;&nbsp;到达城市</label> <input name="destination" type="text" class="form-control"
						style="width: 85px;"  value="" placeholder="到达城市">
				</div>
				<button type="submit" class="btn btn-warning mar-left-10" 
				style= "font-size:18px; border:#FFFFFF; color:#414582; background-color:#FFFFFF;">搜索</button>
			</form>
		</div>
	</div>
	<!-- 搜索结束 -->



	<!-- 列表开始 -->
	<div class="container mar-bottom-30 ">
		<div class="hangbanlist">
			<div>
				<%
					db_conn conn=new db_conn();
					String sql="select * from flight";
					ResultSet res=conn.executeQuery(sql);
					
					while(res.next()){
						String f_i=res.getString(1);
						String s_p=res.getString(2);
						String a_p=res.getString(3);
						String s_a=res.getString(4);
						String a_a=res.getString(5);
						String s_t=res.getString(6);
						String a_t=res.getString(7);
						String f_p=res.getString(8);
						
						String sql2="select sum(t_b) from ticket where f_n='"+f_i+"' and t_d='"+todaydate+"'";
						db_conn conn2=new db_conn();
						ResultSet res2=conn2.executeQuery(sql2);
						if(res2.next())   seat=res2.getString(1);
						if(seat=="null")  seat="0";
				
				%>
			
				<!-- 表头 -->
				<ul class="list-inline bor-bottom-solid-1  ">
					<li class="w-percentage-25" style="font-size:26px;color:#414582;"> <strong><%=f_i %></strong></li>
					
					<li class="w20 time " ><strong><%=s_p %></strong> </li>
					<li class="text-right" style= "color:#414582;"><%=s_a %></li>
					<li class="">—</li>
					<li class="w20 time " ><strong><%=a_p %></strong> </li>
					<li class="w150" style= "color:#414582;"><%=a_a %></li>	
									
					<li class="time w100"><strong><%=s_t %></strong></li>
					<li class="">—</li>
					<li class="time w80"><strong><%=a_t %></strong></li>
					<%if(session.getAttribute("user_id")!=null){ %>
					<li class="pull-right "><button type="button" style= "border:#000000;color:#FFFFFF;background-color:#414582;"
					class="btn btn-danger btn-sm"  onClick="window.location.href ='order.jsp?flight_id=<%=f_i %>';">订票</button></li><%} 
					if(session.getAttribute("user_id")==null){ %> 
					<li class="pull-right "><button type="button" style= "border:#000000;color:#FFFFFF;background-color:#414582;"
					class="btn btn-danger btn-sm"  onClick="window.location.href ='error_login.jsp?flight_id=<%=f_i %>';">订票</button></li><%} %>
					
				</ul>
				<!-- 表头结束 -->
				<!-- 表BODY -->		
				<div class="collapse" id="collapseExample" style="display: block;">
					<div class="hangbanlist-body " style="background-color: #f4f6f7;">
						<ul class="list-inline">
															
							<li class="w-percentage-25">今日剩余座位数：<%=seat %></li>
							<li class="w-percentage-25">价格：<span class="rmb">￥<%=f_p %></span></li>

		
						</ul>
					</div>
				</div>
				<!-- 表BODY 结束 -->
				
				<%
					}
				%>
				
			</div>


			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>