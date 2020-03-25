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
<form method="post" action="../add_flight">

    <div class="panel">
		<div class="panel-body">
			<div class="col-md-12">
				<h3 class="animated fadeInLeft">添加航班</h3>
				<p class="animated fadeInDown">航班管理<span class="fa-angle-right fa"></span>添加航班</p>
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
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">航班号</label>
								<div class="col-sm-11" style="width:200px;">
									<input name="flight_id" type="text" class="form-control" placeholder="例：CA4312">
								</div>
							</div>
						
						
						
						
							<div class="form-group">
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">起点</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="start_place" type="text" class="form-control" placeholder="例：深圳">
								</div>
								
								
								<label class="col-sm-1 control-label text-right" style="width:100px;">终点</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="end_place" type="text" placeholder="例：成都" class="form-control">
								</div>
								
								
								<label class="col-sm-1 control-label text-right" style="width:100px;">始发机场</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="start_airport" type="text" placeholder="例：宝安机场" class="form-control">
								</div>
							</div>
							
							
							<div class="form-group">
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">到达机场</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="end_airport" type="text" placeholder="例：双流机场" class="form-control">
								</div>
									
								<label class="col-sm-1 control-label text-right" style="width:100px;">起飞时间</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="take_off_time" type="text" placeholder="例：19:20:00" class="form-control">
								</div>
									
								<label class="col-sm-1 control-label text-right" style="width:100px;">到达时间</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="landing_time" type="text" placeholder="例：22:15:00" class="form-control">
								</div>
							</div>
							
							
							<div class="form-group">
							
								<label class="col-sm-1 control-label text-right" style="width:100px;">机票价格</label>
								<div class="col-sm-3" style="width:200px;">
									<input name="first_class_price" type="text" placeholder="例：600" class="form-control">

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