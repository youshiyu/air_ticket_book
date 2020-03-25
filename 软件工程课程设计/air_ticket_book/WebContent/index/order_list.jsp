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
<title>机票列表</title>
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
						<li class="hit">机票列表</li>
					</ul>
				</div>
				
				<h4><div class="container" style=" margin-top: 40px;">本人机票</div></h4>
				<div class="container bg-gray-eee box-shadow mar-bottom-30"
					style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 20px;">
					<table border="0" cellspacing="0" cellpadding="0"
						class="table table-hover table-striped font12 table-bordered v-align-top">
						<tr>
							<th style="width:8%;">机票号</th>
							<th style="width:8%;">航班号</th>
							<th style="width:6%;">座位号</th>
							<th style="width:6%;">乘机人</th>
							<th style="width:10%;">起飞日期</th>
							<th style="width:13%;">飞行时间</th>
							<th style="width:23%;">飞行地点</th>	
							<th style="width:6%;">价格</th>		
							<th style="width:8%;">是否付款</th>																			
						</tr>
						
						<%
							db_conn conn=new db_conn();
							String user_id=session.getAttribute("user_id").toString();
							String sql="select * from ticket_view where p_tel='"+user_id+"'";
							ResultSet res=conn.executeQuery(sql);
							while(res.next()){
								
						%>
						
						<tr>
							<td><%=res.getString(1) %></td>
							<td><%=res.getString(2) %></td>
							<td><%=res.getString(6) %></td>
							<td><%=res.getString(14) %></td>
							<td><%=res.getString(3) %></td>				
							<td><%=res.getString(11) %>-<%=res.getString(12) %></td>
							<td><%=res.getString(7) %>(<%=res.getString(9) %>)-<%=res.getString(8) %>(<%=res.getString(10) %>)</td>
							<td><%=res.getString(13) %></td>
							<td><%if(res.getString(18).equals("0")) {out.println("未付款"); }					
							else {out.println("已付款");} %></td>
						</tr>
						
						<%
							}
						%>
			
					</table>
				</div>
				
				
				<h4><div class="container" style=" margin-top: 90px;">为他人订购的机票</div></h4>
				<div class="container bg-gray-eee box-shadow mar-bottom-30"
					style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 30px;">
					<table border="0" cellspacing="0" cellpadding="0"
						class="table table-hover table-striped font12 table-bordered v-align-top">
						<tr>
							<th style="width:8%;">机票号</th>
							<th style="width:8%;">航班号</th>
							<th style="width:6%;">座位号</th>
							<th style="width:6%;">乘机人</th>
							<th style="width:10%;">起飞日期</th>
							<th style="width:13%;">飞行时间</th>
							<th style="width:23%;">飞行地点</th>	
							<th style="width:6%;">价格</th>		
							<th style="width:8%;">是否付款</th>																					
						</tr>
						
						<%
							 conn=new db_conn();
							 user_id=session.getAttribute("user_id").toString();
								String sql2="select * from ticket_view where p_id2 in "+
										"(select p_id from p_inf where p_tel='"+user_id+"') and p_id != p_id2 ";
							ResultSet res2=conn.executeQuery(sql2);
							while(res2.next()){
								
						%>
						
						<tr>
							<td><%=res2.getString(1) %></td>
							<td><%=res2.getString(2) %></td>
							<td><%=res2.getString(6) %></td>
							<td><%=res2.getString(14) %></td>
							<td><%=res2.getString(3) %></td>				
							<td><%=res2.getString(11) %>-<%=res2.getString(12) %></td>
							<td><%=res2.getString(7) %>(<%=res2.getString(9) %>)-<%=res2.getString(8) %>(<%=res2.getString(10) %>)</td>
							<td><%=res2.getString(13) %></td>
							<td><%if(res2.getString(18).equals("0")) {out.println("未付款"); }					
							else {out.println("已付款");} %></td>							
						</tr>
						
						<%
							}
						%>
			
					</table>
				</div>
		</div>		
	</div>
</div>
</body>
</html>