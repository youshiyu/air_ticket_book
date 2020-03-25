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
<title>关联旅客信息</title>
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
						<li class="hit">关联旅客</li>
					</ul>
				</div>
			
			<div class="container bg-gray-eee box-shadow mar-bottom-30"
				style="padding-right: 0px; padding-left: 0px; position: relative; margin-top: 50px; margin-left: 50px;">
				<table border="0" cellspacing="0" cellpadding="0"
					class="table table-hover table-striped font12 table-bordered v-align-top">
					<tr>
						<th style="width:10%;">姓名</th>
						<th style="width:10%;">身份证号</th>
						<th style="width:10%;">电话</th>
						<th style="width:10%;">性别</th>
						<th style="width:10%;">工作单位</th>	
						<th style="width:10%;">操作</th>							
					</tr>
					
					<%
						db_conn conn=new db_conn();
						String user_id=session.getAttribute("user_id").toString();
						String sql="select * from p_inf where p_id in "+
								"(select p_id2 from ptp where p_id in "+
								"(select p_id from p_inf where p_tel='"+user_id+"'))";
						ResultSet res=conn.executeQuery(sql);
						while(res.next()){
							String p_id2=res.getString(1);
					%>
					
					<tr>
						<td><%=res.getString(2) %></td>
						<td><%=p_id2 %></td>
						<td><%=res.getString(3) %></td>
						<td><%=res.getString(4) %></td>
						<td><%=res.getString(5) %></td>			
											
						<td><a style="color:#414582;" href="/air_ticket_book/del_ptp?p_id2=<%=p_id2%>">删除</a></td>
					</tr>
					
					
				
					
					<%
						}
					%>
		
				</table>
			</div>
	
				<div class="ydc-reg-form-group clearfix"  style="margin-top: 40px;">
					<div class="ydc-reg-form-button" style="margin-left: 355px;">
						<a class="btn fl" href="/air_ticket_book/index/ptp_change.jsp">增添关联旅客</a>
					</div>
				</div>	

	</div>	
</div>	

</body>
</html>