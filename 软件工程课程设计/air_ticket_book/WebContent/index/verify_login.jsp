<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("/air_ticket_book/user_center");
		//写成绝对路径，防范错误发生
	}
%>