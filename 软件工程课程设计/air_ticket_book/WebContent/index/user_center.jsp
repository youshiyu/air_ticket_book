<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证用户是否登录的代码 --%>	
<%@page import="javabean.db_conn"%>		
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="img_url" class="javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户中心</title>
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/icon.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/home.css">
<%!String user_name;%>
</head>
<body>


<% 
	db_conn conn=new db_conn();
	String sql="select * from p_inf where p_tel='"+session.getAttribute("user_id")+"'";
	ResultSet res=conn.executeQuery(sql);
	if(res.next())
	user_name=res.getString(2);
%>

	<div class="ydc-entered" style="height:11%;width:100%;">
		<div class="ydc-header-content ydc-flex">

			<div class="ydc-column">
				<div class="ydc-column-user">
					<div class="ydc-user-photo">
						<a href="javascript:;"> 
						</a>
					</div>
					<div class="ydc-user-info">

						<div class="ydc-user-info-func ydc-flex">
							<span class="ydc-mal">
								您好，<%=user_name %>
							</span> 
							<span class="ydc-mal"></span> <a
								href="/air_ticket_book/index/logout.jsp">退出</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="ydc-content-slide ydc-body" style="height:86%;">
		<div class="ydc-flex" style="height:100%;">
			<!-- left begin -->
			<div class="ydc-column ydc-column-2">
				<div class="ydc-menu">
					<ul>
						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-home fl "></i>首页
						</span>
							<ul>
								<li><a target="frame" href="/air_ticket_book/index/user_info.jsp"  >个人资料</a></li>
								<li><a target="frame" href="/air_ticket_book/index/edit_info.jsp"  >修改信息</a></li>
								<li><a target="frame" href="/air_ticket_book/index/ptp_info.jsp"  >关联旅客</a></li>
								<li><a target="frame" href="/air_ticket_book/index/ptp_change.jsp"  >增添关联旅客</a></li>
							</ul></li>

						<li class="ydc-menu-item">
							<span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-record fl"></i>订单
							</span>
							<ul>
								<li><a target="frame" href="/air_ticket_book/index/order_list.jsp"  >机票列表</a></li>
								<li><a target="frame" href="/air_ticket_book/index/order_pay.jsp"  >付款</a></li>
								<li><a target="frame" href="/air_ticket_book/index/order_print_check.jsp"  >机票打印</a></li>
							</ul>
						</li>

						<li class="ydc-menu-item"><span class="ydc-menu-sub-title">
								<i class="ydc-icon ydc-icon-file fl"></i>管理
						</span>
							<ul>
								<li><a href="/air_ticket_book/default/index.jsp"  >返回首页</a></li>
							</ul></li>


					</ul>
				</div>
			</div>
			<!-- left end -->
			
			<!-- right start 用户中心初始状态为显示用户信息 -->
			<div style="width:76%;height:100%;">
				<iframe name="frame" scrolling="auto" width="100%" height="100%" frameborder="0" src="/air_ticket_book/index/user_info.jsp"></iframe>
			</div>
			
			<!-- right end -->
		</div>
	</div>

</body>
</html>