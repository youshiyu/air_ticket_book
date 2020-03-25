<%@page import="java.sql.ResultSet"%>
<%@page import="javabean.db_conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆的代码--%>
<jsp:useBean id="img_url" class="javabean.get_img" scope="session" />
<%session.setAttribute("url", request.getRequestURI());
  session.setAttribute("p_tel",session.getAttribute("user_id"));
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../default/css/bootstrap.min.css" rel="stylesheet">
<link href="../default/css/common.css" rel="stylesheet">
<link href="../default/css/corptravel.css" rel="stylesheet">
<title>修改关联旅客</title>
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/icon.css">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/home.css">

</head>
<body>

	<div class="ydc-content-slide ydc-body">
		<div class="ydc-flex">
			<div class="ydc-column ydc-column-8">
				<div class="ydc-release-content">
					<div class="ydc-tabPanel ydc-tabPanel-release">
						<div class="ydc-release-tab-head">
							<ul>
								<li class="hit">增添关联旅客</li>
							</ul>
						</div>
						<div class="ydc-panes">
							 <form method="post" action="/air_ticket_book/ptp">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
							
									<div class="ydc-reg-form-group clearfix">
										<label>姓名:</label>
										<div class="ydc-reg-form-input">
											<input name="name" type="text"
												class="ydc-form-control" autocomplete="off">
										</div>
									</div>

									<div class="ydc-reg-form-group clearfix">
										<label>电话:</label>
										<div class="ydc-reg-form-input">
											<input name="tel" type="text"
												class="ydc-form-control" autocomplete="off">
										</div>

									</div>
																	

								</div>
								<div class="ydc-reg-form-group clearfix"  style="margin-top: 40px;color:#414582;">
									<div class="ydc-reg-form-button" style="margin-left: 350px;color:#414582;">
										<button class="btn fl" style="color:#414582;" type="submit" value="提交">确认增添</button>					
									</div>								
								</div>
								
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
