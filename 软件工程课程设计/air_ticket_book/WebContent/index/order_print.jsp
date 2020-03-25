<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<jsp:useBean id="img_url" class="javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/home.css">

<title>机票打印</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</head>
<body>
	
	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">机票打印</li>
							</ul>
						</div>	
				
					<%
						db_conn conn=new db_conn();
						String user_id=session.getAttribute("user_id").toString();
						String t_id="10001323991";//之后修改成读取到的机票号
						String sql="select * from ticket_view where t_id='"+t_id+"'";
						ResultSet res=conn.executeQuery(sql);
						while(res.next()){
							if(res.getString(18).equals("0")) //未付款
							{%><h3><div style="margin-left:30px; margin-top:30px;">该机票尚未付款，请付款后再来打印</div></h3>
							<% break;}
							String flight_id=res.getString(2);
							String t_d=res.getString(3);//起飞日期
							String p_id=res.getString(4);//身份证号
							String t_s=res.getString(6);//座位号
							String s_p=res.getString(7);
							String e_p=res.getString(8);
							String s_a=res.getString(9);
							String e_a=res.getString(10);
							String t_t=res.getString(11);//起飞时间
							String l_t=res.getString(12);//到达时间
							String p_name=res.getString(14);//持票人
					%>

					
	<div class="container bg-gray-eee box-shadow mar-bottom-30"
		style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 20px;">
		<div class="col-sm-7 container bg-gray-eee  pad-bottom-20"
			style="margin-top: 30px; margin-bottom: 30px;">

		</div>
		<div class="col-sm-5 bg-gray-eee">
			<div style="margin-left: -15px;margin-top: 110px;">
				<h3 style="overflow: hidden; margin-left: 30px;">
					<span style="display: block; float: left; margin-left:20px;">机票号<br><%=t_id%></span>
					<span style="display: block; float: left; margin-left:60px;">起飞日期<br><%=t_d%></span>
					<span style="display: block; float: left; margin-left:80px;">持票人<br><%=p_name%></span>
					<span style="display: block; float: left; margin-left:-212px;"><br><br><br>机型<br><%=flight_id%></span>
					<span style="display: block; float: left; margin-left:-50px;"><br><br><br>座位号<br><%=t_s%></span>
					
				</h3>
			</div>
		</div>
				<h1>
				<span style="display: block; float: left; margin-left: 540px; margin-top:-100px;"><%=s_p+"    "%>——<%="    "+e_p %></span>
				<span style="display: block; float: right; color: #999; font-size: 20px; margin-right: 5px;"></span>
				</h1>
				

				<div class="flight-from" style="margin-top:0px;margin-left: 460px; float: left ">
					<span class="time text-center"><%=t_t %></span><br /> 
					<span class="text-center"><%=s_a %></span>
				</div>
				
				<div class="flight-info" style="float: left; margin-bottom: 290px; margin-left: 30px;">
					<img src="../default/images/a.png"> <span class="font12 gray-999">2h35m</span>
					<img src="../default/images/b.png"><br /> <img src="../default/images/c.png" class="mar-left-30;"> <span
						class="text-center font12 gray-999">乘坐<%=flight_id %></span><br /> <span
						class="airline-direct"></span> <span class="arrow"></span>
				</div>
				
			
				<div class="flight-to" style="margin-top: 0px; margin-right: 110px;float: right">
					<span class="time text-center"><%=l_t %></span><br /> <span
						class="text-center"><%=e_a %></span>
				</div>

		
		</div>
		
		</div>
		
	
		
				</div>
			</div>
		</div>	
	</div>
		
	<% } %>
</body>
</html>


