<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//添加URL session ，作为用户登录后跳转回来的依据,登录servlet中已经写了判断程序，如果有url_cookie，就跳转到url_cookie，如果没有，就跳转到用户中心
	session.setAttribute("url", request.getRequestURI());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>机票预订系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/corptravel.css" rel="stylesheet">
<link href="css/enterprise.css" rel="stylesheet">
<link href="css/iconfont.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<%! String user_name,seat; 
	String todaydate="2019-12-01";%>
<!--今日日期，为方便测试此处设定为固定值-->

</head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div><h3>出错了，机票不够</h3></div>
</body>
</html>