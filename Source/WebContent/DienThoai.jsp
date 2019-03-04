<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="Models.SanPhamViewModel"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="com.sun.jdi.Value"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Điện Thoại - Mobile World</title>
<link rel="icon" href="img/icon-mobile.png" type="image/gif" > 
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
					<!-- Menuleft here -->
					<jsp:include page="MenuLeft.jsp"></jsp:include>
					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<label>Danh Mục Điện Thoại</label>
						</div>
						<!-- /store top filter -->

						<!-- store products -->
						<div class="row">
						<%
							DecimalFormat formatter = new DecimalFormat("###,###,###");	
							int pageIndex = 0;
							if(request.getParameter("pageIndex") != null){
								pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
							}
						
							SanPhamDAO dao = new SanPhamDAO();		

							int ResultNumber = 0;
							ResultNumber = dao.SoLuongSanPhamTheoLoai("1");
							
							int pageSize = 6;
							int Start, End;
							
							if(ResultNumber < pageSize){
								Start = 1;
								End = ResultNumber;
							}else{
								Start = (pageIndex -1) * pageSize + 1;
								End = Start + pageSize - 1;
							}
							
							List<SanPhamViewModel> list = dao.LaySanPhamTheoLoai("1", Start, End);
							
							for(SanPhamViewModel sp : list){
								String anh = dao.Lay1AnhSanPham(sp.getId());
						%>
							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
								
								<input name = "Id" style="display: none" value="<%=sp.getId()%>">
								<input name = "SoLuong" id="txtSoLuong" style="display: none" value="1">
									<div class="product-img">
										<img src="./img/products/<%=anh %>" alt="">
										<div class="product-label">
											<span class="new">NEW</span>
										</div>
									</div>
									<div class="product-body">
										
										<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id=<%=sp.getId()%>"><%=sp.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(sp.getGia())%> VNĐ <del class="product-old-price"><%=formatter.format(sp.getGia()+ 500000) %></del></h4>
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
											<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Chi Tiết</span></button>
										</div>
									</div>
									<div class="add-to-cart">
											<button id="btnAddtoCart" class="add-to-cart-btn" data-id="<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ</button>
									</div>
								
								</div>
							</div>
							<!-- /product -->
							<%
								}
							%>
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty">Sản phẩm: <%=Start %> đến <%=End %></span>
							<ul class="store-pagination">
							<%
								int pageNuber1 = ResultNumber / pageSize + 1;
								int pagePrev= 0;
								if(pageIndex > 1){
									pagePrev = pageIndex -1; 
								}else{
									pagePrev = pageNuber1;
								}
							
							%>
							<li><a href="DienThoai.jsp?pageIndex=<%=pagePrev%>"><i class="fa fa-angle-left"></i></a></li>

							<%
								int pageNuber = ResultNumber / pageSize + 1;
								
								for(int i= 1; i<= pageNuber; i++){
									if(i == pageIndex){							
							%>
								<li class="active"><%=i %></li>
							<%
									}
									else{	
							%>
									<li> <a href="DienThoai.jsp?pageIndex=<%=i%>"><%=i %></a></li>
							<%
									}
								}
							%>
								<%
									int pageNext = 0;
									if(pageIndex < pageNuber){
										pageNext = pageIndex +1;
									}else{
										pageNext = 1;
									}
								%>
								<li><a href="DienThoai.jsp?pageIndex=<%=pageNext%>"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<jsp:include page="Footer.jsp"></jsp:include>
		</body>
</html>