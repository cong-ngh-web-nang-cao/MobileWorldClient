<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="Models.SanPhamViewModel"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chi Tiết Sản Phẩm</title>
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
	<%
		DecimalFormat formatter = new DecimalFormat("###,###,###");	
	
		int id =Integer.parseInt((String)request.getAttribute("IdSP"));
		
		SanPhamDAO dao = new SanPhamDAO();
		SanPhamViewModel model = dao.ChiTietSanPham(id);
	%>
	<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				
					<!-- Product main img -->
					<div class="col-md-5 col-md-push-2">
						<div id="product-main-img">
						<%
							List<String> list = dao.LayAnhSanPham(id);
					
							for(int i=0; i<list.size(); i++){
								String anh = list.get(i);
						%>
							<div class="product-preview">
								<img src="./img/products/<%=anh %>" alt="">
							</div>
						<%
							}
						%>
							
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product thumb imgs -->
					<div class="col-md-2  col-md-pull-5">
						<div id="product-imgs">
						<%
							//List<String> list = dao.LayAnhSanPham(id);
					
							for(int i=0; i<list.size(); i++){
							String anh = list.get(i);
						%>
							<div class="product-preview">
								<img src="./img/products/<%=anh %>" alt="">
							</div>
						<%
							}
						%>	
						</div>
					</div>
					<!-- /Product thumb imgs -->

					<!-- Product details -->
					<div class="col-md-5">
						<div class="product-details">
							<h2 class="product-name"><%=model.getTenSP() %></h2>
							<div>
								<div class="product-rating">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star-o"></i>
								</div>
								
							</div>
							<div>
								<h3 class="product-price"><%=formatter.format(model.getGia())%> VNĐ <del class="product-old-price"><%=formatter.format(model.getGia()+ 500000) %></del></h3>
								<span class="product-available">Còn Hàng</span>
							</div>

							<div class="product-options">
								<label>
									Kích Cỡ
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label>
									Màu Sắc
									<select class="input-select">
										<option value="0">Đen</option>
										<option value="0">Đỏ</option>
									</select>
								</label>
							</div>

						<!--<form action="/MobileWorldClient/ThemGioHang" method="post">  -->
						<input name = "Id" style="display: none" value="<%=model.getId()%>">
							<div class="add-to-cart">
								<div class="qty-label">
									Số Lượng
									<div class="input-number">
										<input id="txtSoLuong" name="SoLuong" type="number" value="1">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<button class="add-to-cart-btn" data-id="<%=model.getId()%>"><i class="fa fa-shopping-cart"></i> Thêm Vào Giỏ</button>
							</div>
						
							<ul class="product-btns">
								<li><a href="#"><i class="fa fa-heart-o"></i> Yêu Thích</a></li>
								<li><a href="#"><i class="fa fa-exchange"></i> So Sánh</a></li>
							</ul>

							<ul class="product-links">
								<li>Thẻ:</li>
								<li><a href="#">Điện Thoại</a></li>
								<li><a href="#">SmartPhones</a></li>
							</ul>

							<ul class="product-links">
								<li>Chia Sẻ:</li>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-envelope"></i></a></li>
							</ul>

						</div>
					</div>
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab1">Sản Phẩm</a></li>
								<li><a data-toggle="tab" href="#tab2">Cấu Hình</a></li>
								<li><a data-toggle="tab" href="#tab3">Bình Luận (3)</a></li>
							</ul>
							<!-- /product tab nav -->

							<!-- product tab content -->
							<div class="tab-content">
								<!-- tab1  -->
								<div id="tab1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-md-12">
											<p>Sản phẩm điện thoại di động</p>
										</div>
									</div>
								</div>
								<!-- /tab1  -->

								<!-- tab2  -->
								<div id="tab2" class="tab-pane fade in">
									<div class="row">
										<div class="col-md-12">
											<p>Tên Sản Phẩm: <%=model.getTenSP() %> </p>
											<p>Giá: <%=formatter.format(model.getGia()) %> VNĐ</p>
											<p>Camera Trước: <%=model.getCamTruoc() %> </p>
											<p>Camera Sau: <%=model.getCamSau() %> </p>
											<p>ROM: <%=model.getROM() %> Gb</p>
											<p>RAM: <%=model.getRAM() %> Gb</p>
											<p>Thẻ Nhớ: <%=model.getTheNho() %> Gb</p>
										</div>
									</div>
								</div>
								<!-- /tab2  -->

								<!-- tab3  -->
								<div id="tab3" class="tab-pane fade in">
									<div class="row">
										<!-- Rating -->
										<div class="col-md-3">
											<div id="rating">
												<div class="rating-avg">
													<span>4.5</span>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
													</div>
												</div>
												<ul class="rating">
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
														</div>
														<div class="rating-progress">
															<div style="width: 80%;"></div>
														</div>
														<span class="sum">3</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div style="width: 60%;"></div>
														</div>
														<span class="sum">2</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
													<li>
														<div class="rating-stars">
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
															<i class="fa fa-star-o"></i>
														</div>
														<div class="rating-progress">
															<div></div>
														</div>
														<span class="sum">0</span>
													</li>
												</ul>
											</div>
										</div>
										<!-- /Rating -->

										<!-- Reviews -->
										<div class="col-md-6">
											<div id="reviews">
												<ul class="reviews">
													<li>
														<div class="review-heading">
															<h5 class="name">Vũ Mạnh Tuấn</h5>
															<p class="date">18/02/2018 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Sản phẩm tốt, chơi game mượt</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">Ngô Thị Dung</h5>
															<p class="date">01/02/2018 6:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Máy chụp ảnh đẹp</p>
														</div>
													</li>
													<li>
														<div class="review-heading">
															<h5 class="name">Nguyễn Đức Sơn</h5>
															<p class="date">18/02/2018 8:0 PM</p>
															<div class="review-rating">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o empty"></i>
															</div>
														</div>
														<div class="review-body">
															<p>Chơi Liên Quân mobile mượt, pin hơi yếu</p>
														</div>
													</li>
												</ul>
												<ul class="reviews-pagination">
													<li class="active">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
												</ul>
											</div>
										</div>
										<!-- /Reviews -->

										<!-- Review Form -->
										<div class="col-md-3">
											<div id="review-form">
												<form class="review-form">
													<input class="input" type="text" placeholder="Tên bạn">
													<input class="input" type="email" placeholder="Email">
													<textarea class="input" placeholder="Nhận Xét"></textarea>
													<div class="input-rating">
														<span>Bình Chọn: </span>
														<div class="stars">
															<input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
															<input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
															<input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
															<input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
															<input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
														</div>
													</div>
													<button class="primary-btn">Thêm Nhận Xét</button>
												</form>
											</div>
										</div>
										<!-- /Review Form -->
									</div>
								</div>
								<!-- /tab3  -->
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		
		<jsp:include page="SanPhamHot.jsp"></jsp:include>
		<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>