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
						<li><a href="#"><i class="fa fa-user-o"></i> Vũ Mạnh Tuấn</a></li>
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
									<img src="./img/logo.png" alt="">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form>
									<select class="input-select">
										<option value="0">Tất Cả</option>
										<option value="1">Điện Thoại</option>
										<option value="1">Máy Tính Bảng</option>
									</select>
									<input class="input" placeholder="Sản phẩm cần tìm...">
									<button class="search-btn">Tìm Kiếm</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div>
									<a href="#">
										<i class="fa fa-heart-o"></i>
										<span>Yêu Thích</span>
										<div class="qty">2</div>
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<%
										SanPhamDAO dao = new SanPhamDAO();
										DecimalFormat formatter = new DecimalFormat("###,###,###");
							        	HttpSession ses = request.getSession();
							        	List<GioHangModel> Cart = (List<GioHangModel>)ses.getAttribute("Cart");
							        	
							        	
						        	
							        	int TongTien = 0;
							        	int SoSanPham = 0;
							        	if(Cart != null){
							        		for(GioHangModel model : Cart){
								        		SoSanPham = SoSanPham + model.getSoLuong();
								        		TongTien = TongTien + model.getTongTien();
								        	}
							        	}
							        %>
									<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<i class="fa fa-shopping-cart"></i>
										<span>Giỏ Hàng</span>
										<div class="qty"><%=SoSanPham%></div>
									</a>
									<div class="cart-dropdown">
									<% 
										if(Cart != null && Cart.size() >0){
									%>
										<div class="cart-list">
										<%
											for(GioHangModel model : Cart){
												String anhsp = dao.Lay1AnhSanPham(model.getSanPham().getId());
										%>
											<div class="product-widget">
												<div class="product-img">
													<img src="./img/products/<%=anhsp %>" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#"><%=model.getSanPham().getTenSP() %></a></h3>
													<h4 class="product-price"><span class="qty"><%=model.getSoLuong() %>x</span><%=formatter.format(model.getSanPham().getGia())%> đ</h4>
												</div>
												<a class="delete" href="/MobileWorldClient/XoaGioHang?id=<%=model.getSanPham().getId()%>"><i class="fa fa-close"></i></a>
											</div>
										<%
											}
										%>
										</div>
										<div class="cart-summary">
											<p><%=SoSanPham %> sản phẩm</p>
											<h5>Tổng Tiền: <%=formatter.format(TongTien) %> VNĐ</h5>
										</div>
										<div class="cart-btns">
											<a href="GioHang.jsp">Chi Tiết</a>
											<a href="#">Đặt Hàng  <i class="fa fa-arrow-circle-right"></i></a>
										</div>
										
										<%
							        		}
							        		else
							        		{
										%>
										<h5>Giỏ Hàng Trống</h5>
										<%
											}
							        	%>
									</div>
									
								</div>
								<!-- /Cart -->

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
						<li><a href="#">Trang Chủ</a></li>
						<li><a href="DienThoai.jsp?pageIndex=1">Điện Thoại</a></li>
						<li><a href="#">Máy Tính Bảng</a></li>
						<li><a href="#">Khuyến Mại</a></li>
						<li><a href="#">Bảo Hành</a></li>
						<li><a href="#">Thông Tin - Liên Hệ</a></li>
						<li><a href="GioHang.jsp">Giỏ Hàng</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		
		
		
</body>
</html>