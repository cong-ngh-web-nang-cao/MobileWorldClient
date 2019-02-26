<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="Models.SanPhamViewModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Sản Phẩm Mới</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Điện Thoại</a></li>
									<li><a data-toggle="tab" href="#tab1">Máy Tính Bảng</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->
					
					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<input name = "SoLuong" id="txtSoLuong" style="display: none" value="1">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
									
									<%
										DecimalFormat formatter = new DecimalFormat("###,###,###");	
									
										SanPhamDAO dao = new SanPhamDAO();
										List<SanPhamViewModel> list = (List<SanPhamViewModel>) dao.SanPhamMoi();
									
										for(int i = 0; i< list.size(); i++){		
											SanPhamViewModel model = list.get(i);
											
											String anhsp = dao.Lay1AnhSanPham(model.getId());
											
									%>
									
										<!-- product -->
										<div class="product">
										<!--<form action="/MobileWorldClient/ThemGioHang" method="post">  -->
											
											<div class="product-img">
												
												<img src="./img/products/<%=anhsp %>" alt="anhsanpham">
												<div class="product-label">
													
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category"><%=model.getDanhMuc()%></p>
												<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id=<%=model.getId()%>"><%=model.getTenSP()%></a></h3>
												<h4 class="product-price"><%=formatter.format(model.getGia())%> VND </h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu Thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Giỏ Hàng</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem Luôn</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button id="btnAddtoCart" class="add-to-cart-btn" data-id="<%=model.getId()%>"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ</button>
											</div>
											<!-- </form> -->
										</div>
										
										<!-- /product -->
										<% } %>
										
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
								
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- HOT DEAL SECTION -->
		<div id="hot-deal" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3>02</h3>
										<span>Ngày</span>
									</div>
								</li>
								<li>
									<div>
										<h3>10</h3>
										<span>Giờ</span>
									</div>
								</li>
								<li>
									<div>
										<h3>34</h3>
										<span>Phút</span>
									</div>
								</li>
							</ul>
							<h2 class="text-uppercase">Khuyến Mại Hot</h2>
							<p>Quà tặng cho khách hàng may mắn</p>
							<a class="primary-btn cta-btn" href="#">Xem Thêm</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /HOT DEAL SECTION -->
		
		