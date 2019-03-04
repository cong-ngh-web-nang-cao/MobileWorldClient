<%@page import="Models.NguoiDungModel"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.GioHangModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +0978 999 999</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> mobile@mta.edu.vn</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i> 236 Hoàng Quốc Việt</a></li>
					</ul>
					<ul class="header-links pull-right">
						<li><a href="#"><i class="fa fa-dollar"></i> VND</a></li>
						<li id = "tennguoidung"></li>
						<li id = "btnDangXuat"></li>
					</ul>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo">
								<a href="/MobileWorldClient/TrangChu" class="logo">
									<img src="./img/logo3.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form action="TimKiemSanPham" method="POST">
									<select class="input-select">
										<option value="0">Tất Cả</option>
										<option value="1">Điện Thoại</option>
										<option value="1">Máy Tính Bảng</option>
									</select>
									<input name="TuKhoa" class="input" placeholder="Sản phẩm cần tìm...">
									<button type="submit" class="search-btn">Tìm Kiếm</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Cart -->
								<div class="dropdown">
									
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Giỏ Hàng</span>
										<div id="sosanpham" class="qty"></div>
									</a>
									<div id="cartInfo" class="cart-dropdown">
										
									</div>
									
								</div>
								<!-- /Cart -->

								<%
									HttpSession ses = request.getSession();
									NguoiDungModel model = (NguoiDungModel) ses.getAttribute("NguoiDung");
									
									if(model != null){
								%>
								<!-- Wishlist -->
								<div>
									<a href="DonHangCuaBan.jsp">
										<i class="fa fa-address-card-o"></i>
										<span>Đơn Hàng</span>
										<div id="SoLuongDonHang" class="qty"></div>
									</a>
								</div>
								<!-- /Wishlist -->
								<%
									}
								%>


								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li><a class="btnTrangChu" href="Index.jsp">Trang Chủ</a></li>
						<li><a href="DienThoai.jsp?pageIndex=1">Điện Thoại</a></li>
						<li><a href="#">Máy Tính Bảng</a></li>
						<li><a href="#">Khuyến Mại</a></li>
						<li><a href="#">Bảo Hành</a></li>
						<li><a href="#">Thông Tin - Liên Hệ</a></li>
						
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Tài Khoản <b class="caret"></b></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="DangNhap.jsp">Đăng Nhập</a></li>
								<li><a href="TaoTaiKhoan.jsp">Tạo Tài Khoản</a></li>
							</ul>
							
							
						</li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		
		
		
</body>
</html>