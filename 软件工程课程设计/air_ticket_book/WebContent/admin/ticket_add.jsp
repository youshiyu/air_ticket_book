<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="verify_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="/air_ticket_book/admin/asset/css/style.css" >
</head>
<body >
<form method="post" action="/air_ticket_book/addticket">

    <div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">添加机票</h3>
				<p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>添加机票</p>
			</div>
		</div>
    </div>
	
	
	
    <div class="form-element">
		<div class="col-md-12 padding-0">
			<div class="col-md-12">
				<div class="panel form-element-padding">
					<div class="panel-heading">
						<h4>基本表单</h4>
					</div>
					<div class="panel-body" style="padding-bottom:30px;">
						<div class="col-md-12">
						
							<div class="form-group">
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">机票订单号</label>
								<div class="col-sm-11" style="width:800px;">
									<input name="ticket_id" type="text" class="form-control" placeholder="例：10001323999">
								</div>
							</div>
						
						
						
						
							<div class="form-group">
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">航班号</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="flight_id" type="text" class="form-control" placeholder="例：GJ8821">
								</div>
								
								
								<label class="col-sm-1 control-label text-right" style="width:100px;">日期</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="date" type="text" placeholder="例：2019-12-02" class="form-control">
								</div>
								
								
								<label class="col-sm-1 control-label text-right" style="width:100px;">座位号</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="seat_id" type="text" placeholder="例：A23" class="form-control">
								</div>
							</div>
							
						
							
                
						</div>
					</div>
				</div>
          
				<div class="col-md-12 text-center" style="margin:20px;">
					<input class="submit btn btn-danger" type="submit" value="提交">
				</div>
				
				
			</div>
		</div>
    </div>

</form>
</body>
</html>