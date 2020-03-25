
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %><%--包含验证登陆的代码--%>
<!DOCTYPE html>
<html>
<title>修改用户信息</title>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/air_ticket_book/index/css/core.css">
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
								<li class="hit">帐号设置</li>
							</ul>
						</div>
						<div class="ydc-panes">
							<form action="../upload_img" enctype="multipart/form-data" method="post">
								<div class="ydc-reg-form-class ydc-reg-form-reg"
									style="margin-top: 40px;">
							
									<div class="ydc-reg-form-group clearfix">
										<label>姓名:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user4"
												class="ydc-form-control" autocomplete="off">
										</div>
									</div>

									<div class="ydc-reg-form-group clearfix">
										<label>电话:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user4"
												class="ydc-form-control" autocomplete="off">
										</div>

									</div>
									
									<div class="ydc-reg-form-group clearfix">
										<label>工作单位:</label>
										<div class="ydc-reg-form-input">
											<input type="text" id="user4"
												class="ydc-form-control" autocomplete="off">
										</div>

									</div>		
								
																									
								</div>	
													
								</div>
								<div class="ydc-reg-form-group clearfix"
									style="margin-top: 40px;">
									<div class="ydc-reg-form-button" style="margin-left: 255px;">
										<a class="btn fl" >保存</a>
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