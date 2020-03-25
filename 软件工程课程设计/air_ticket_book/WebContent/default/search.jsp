<%@page import="javabean.flight"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javabean.db_conn"%>		
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订系统</title>
<link href="/air_ticket_book/default/css/bootstrap.min.css" rel="stylesheet">
<link href="/air_ticket_book/default/css/common.css" rel="stylesheet">
<link href="/air_ticket_book/default/css/corptravel.css" rel="stylesheet">
<link href="/air_ticket_book/default/css/enterprise.css" rel="stylesheet">
<link href="/air_ticket_book/default/css/iconfont.css" rel="stylesheet">
<script type="/air_ticket_book/default/text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="/air_ticket_book/default/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<%! db_conn conn2=new db_conn();
	String seat;
    String user_name;
	String todaydate="2019-12-01";%>
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
					<% 
					    String todaydate="2019-12-01"; 
					    if(session.getAttribute("user_id")!=null){ 
							db_conn conn2=new db_conn();
							String sql2="select * from p_inf where p_tel='"+session.getAttribute("user_id")+"'";
							ResultSet res2=conn2.executeQuery(sql2);
							if(res2.next())
							  user_name=res2.getString(2);
						
					%>
							<a href="javacript:none" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								您好，<%=user_name%>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="/air_ticket_book/default/logout.jsp">退出</a></li>
							</ul>
						<%}else{ %>
							<a href="/air_ticket_book/user_center" class="dropdown-toggle"  role="button" aria-haspopup="true" aria-expanded="false">
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
				<a class=" " href="/air_ticket_book/default/index.jsp"><img src="/air_ticket_book/default/images/newlogo.png"
					width="350" height="70" alt="系统LOGO" class="pull-left mar-right-30"
					style="margin-left: -15px;"></a>

			</div>


			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="/air_ticket_book/default/index.jsp"><i
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
				<div class="form-group mar-left-1410" >
					<label for="" >今日日期：<%=todaydate%></label>
				</div>
				<div class="form-group mar-left-10" >
					<label for="" >出发城市</label> <input name="departure" type="text" class="form-control"
						style="width: 85px;" id="" value="" placeholder="出发城市">
				</div>
				<div class="form-group">
					<label for="">到达城市</label> <input name="destination" type="text" class="form-control"
						style="width: 85px;" id="" value="" placeholder="到达城市">
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
					ArrayList flightlist=(ArrayList)request.getAttribute("flightlist");
					if(flightlist.size()==0){
						out.println("对不起，未找到您需要的航班，请重新查找");
					}else{
						for(int i=0;i<flightlist.size();i++){
							flight flight_info=(flight)flightlist.get(i);
							double f_p_i=Double.parseDouble(flight_info.getF_p());
							String f_i=flight_info.getF_n();
							String sql2="select sum(t_b) from ticket where f_n='"+flight_info.getF_n()+"' and t_d='"+todaydate+"'";
							db_conn conn2=new db_conn();
							ResultSet res2=conn2.executeQuery(sql2);
							if(res2.next())   seat=res2.getString(1);
				%>
				
				<!-- 表头 -->
				<ul class="list-inline bor-bottom-solid-1  ">
					<li class="w-percentage-25" style="font-size:26px;color:#414582;"><strong><%=flight_info.getF_n()%></strong></li>
					
					<li class="w20 time "><strong><%=flight_info.getF_s_p()%></strong> </li>
					<li class="text-right" style= "color:#414582;"><%=flight_info.getF_s_a() %></li>
					<li class="">—</li>
					<li class="w20 time "><strong><%=flight_info.getF_a_p() %></strong> </li>
					<li class="w150" style= "color:#414582;"><%=flight_info.getF_a_a() %></li>	
					<li class="time w100"><strong><%=flight_info.getF_s_t() %></strong></li>
					<li class="">—</li>
					<li class="time w80"><strong><%=flight_info.getF_a_t() %></strong></li>
					
					<%if(session.getAttribute("user_id")!=null){ %>
					<li class="pull-right "><button type="button" style= "border:#000000;color:#FFFFFF;background-color:#414582;"
					class="btn btn-danger btn-sm"  onClick="window.location.href ='default/order.jsp?flight_id=<%=f_i%>';">订票</button></li><%} %>
					<%if(session.getAttribute("user_id")==null){ %>
					<li class="pull-right "><button type="button" style= "border:#000000;color:#FFFFFF;background-color:#414582;"
					class="btn btn-danger btn-sm"  onClick="window.location.href ='default/error_login.jsp?flight_id=<%=f_i%>';">订票</button></li><%} %>
					
				</ul>
				<!-- 表头结束 -->
				<!-- 表BODY -->		
				<div class="collapse" id="collapseExample" style="display: block;">
					<div class="hangbanlist-body " style="background-color: #f4f6f7;">
						<ul class="list-inline">
							<li class="w-percentage-25">今日剩余座位数：<%=seat %></li>
							<li class="w-percentage-25">价格：<span class="rmb">￥<%=flight_info.getF_p() %></span></li>
						</ul>
					</div>
				</div>
				<!-- 表BODY 结束 -->
				<%
						}
					}
				%>
			</div>


			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>