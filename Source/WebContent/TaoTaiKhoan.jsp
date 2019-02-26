<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tạo Tài Khoản</title>
<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
	
	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
	
	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
	
	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
	
	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	
	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
	
	<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css"/>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- Order Details -->
					<div class="col-md-6 order-details">
							<div class="section-title">
								<h3 class="title">Tạo Tài Khoản</h3>
							</div>
							<div class="form-group">
								<input class="input" type="number" name="first-name" placeholder="Số điện thoại">
							</div>
							<div class="form-group">
								<input class="input" type="password" name="last-name" placeholder="Mật khẩu">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="first-name" placeholder="Email">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Họ Tên">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Địa Chỉ">
							</div>
							
							
							
							<div class="col-md-12">
								<div class="col-md-6">
									<a href="#" class="primary-btn order-submit">Tạo Tài Khoản</a>
								</div>
								<div class="col-md-6">
									<a href="#" class="primary-btn order-submit">Hủy Bỏ</a>
								</div>
								
							</div>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		
		<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>