<%@page import="javabean.db_conn"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆代码--%>
<jsp:useBean id="img_url" class="javabean.get_img" scope="session" />
<jsp:setProperty property="user_id" name="img_url" value="<%=session.getAttribute(\"user_id\") %>"/>
<!DOCTYPE html>
<html>
<title>用户个人信息</title>
<head>

<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/home.css">
<%! String user_name,p_id,p_work,p_sex;%>
</head>
<body>
<% 
		db_conn conn=new db_conn();
		String sql="select * from p_inf where p_tel='"+session.getAttribute("user_id")+"'";
		ResultSet res=conn.executeQuery(sql);
		if(res.next())
		{
		user_name=res.getString(2);
		p_id=res.getString(1);
		p_work=res.getString(5);
		p_sex=res.getString(4);
		}
	%>
	
	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">

			<!-- right begin -->
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">个人资料</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<div class="ydc-pane ydc-pane-clear" style="display: block;">
								<div class="ydc-reg-form-group clearfix">
									<label>电话号码</label>
									<div class="ydc-reg-form-input">
										<label><%=session.getAttribute("user_id") %></label>
									</div>
								</div>

								<div class="ydc-reg-form-group clearfix">
									<label>姓名</label>
									<div class="ydc-reg-form-input">
										<label><%=user_name %></label>
									</div>
								</div>
							
								<div class="ydc-reg-form-group clearfix">
									<label>身份证号</label>
									<div class="ydc-reg-form-input">
										<label><%=p_id %></label>
									</div>
								</div>
								
															
								<div class="ydc-reg-form-group clearfix">
									<label>性别</label>
									<div class="ydc-reg-form-input">
										<label><%=p_sex %></label>
									</div>
								</div>
								
								<div class="ydc-reg-form-group clearfix">
									<label>工作单位</label>
									<div class="ydc-reg-form-input">
										<label><%=p_work %></label>
									</div>
								</div>								
								

								<div class="ydc-reg-form-group clearfix"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<a class="btn fl" href="/air_ticket_book/index/edit_info.jsp">修改</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- right end -->
		</div>
	</div>

</body>
</html>