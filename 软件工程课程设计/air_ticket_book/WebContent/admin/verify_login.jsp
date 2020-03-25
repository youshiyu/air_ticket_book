
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	try{
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("/air_ticket_book/frame");
		}
	}catch(Exception e){
		System.out.println("验证登陆时出现异常"+e);
		response.sendRedirect("/air_ticket_book/frame");
	}
%>