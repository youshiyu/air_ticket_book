<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("/air_ticket_book/index/login_reg.jsp");
		//写成绝对路径，防范错误发生
	}
%>