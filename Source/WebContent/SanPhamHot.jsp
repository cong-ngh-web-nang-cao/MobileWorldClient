<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.SanPhamViewModel"%>
<%@page import="DAO.SanPhamDAO"%>
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
							<h3 class="title">Sản Phẩm Hot</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab2">Điện Thoại</a></li>
									<li><a data-toggle="tab" href="#tab2">Máy Tính Bảng</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
									<%
										DecimalFormat formatter = new DecimalFormat("###,###,###");
									
										SanPhamDAO dao = new SanPhamDAO();
										List<SanPhamViewModel> list = dao.SanPhamHot();
										
										for(int i=0; i<list.size(); i++){
											SanPhamViewModel model = list.get(i);
											
											String anhsp = dao.Lay1AnhSanPham(model.getId());
										
									%>									
										<!-- product -->
										<div class="product">
										<form action="/MobileWorldClient/ThemGioHang" method="post">
											<input name = "Id" style="display: none" value="<%=model.getId()%>">
											<input name = "SoLuong" style="display: none" value="1">
										
											<div class="product-img">
												<img src="./img/products/<%=anhsp %>" alt="">
												<div class="product-label">
													<span class="sale">-500K</span>
													<span class="new">HOT</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category"><%=model.getDanhMuc() %></p>
												<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id=<%=model.getId()%>"><%=model.getTenSP() %></a></h3>
												<h4 class="product-price"><%=formatter.format(model.getGia()) %> VND <del class="product-old-price"><%=formatter.format(model.getGia() + 500000) %></del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu Thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So Sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem Luôn</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i> Thêm Vào Giỏ</button>
											</div>
										</form>
										</div>
										<!-- /product -->
										<%
											}
										%>
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>