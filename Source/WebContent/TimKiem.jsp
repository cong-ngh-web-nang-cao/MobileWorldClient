<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="Models.SanPhamViewModel"%>
<%@page import="java.util.List"%>
<%@page import="DAO.TimKiemDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tìm Kiếm Sản Phẩm</title>
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

					<%
						DecimalFormat formatter = new DecimalFormat("###,###,###");
						TimKiemDAO dao = new TimKiemDAO();
						SanPhamDAO daodp= new SanPhamDAO();	
					
						int pageIndex = 0;
						
					
						if(request.getParameter("pageIndex") != null){
							pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
						}
						
						HttpSession ses = request.getSession();
						String TuKhoa = (String)ses.getAttribute("TuKhoa");
						
						int pageSize = 6;
						
						int Start = (pageIndex - 1) * pageSize + 1; 
						
						int resultNumber = dao.SoKetQuaTimThay(TuKhoa);
						
						int End = Start + pageSize -1;
						if(Start + pageSize -1 >= resultNumber){
							End = resultNumber;
						}
						
						
						
						List<SanPhamViewModel> ketqua = dao.KetQuaTimKiem(TuKhoa, Start, End);
							
							
								
							
						%>
					<!-- STORE -->
					<div id="store" class="col-md-12">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<span style="font-size: 18px">Tìm thấy <strong style="color: red; font-size: 25px"><%=resultNumber %></strong> kết quả phù hợp với từ khóa " <strong style="color: red; font-size: 20px"><%=TuKhoa %></strong> "</span>
							</div>
							
						</div>
						<!-- /store top filter -->
						
						
						
						<!-- store products -->
						<div class="row">
							<%
								for(SanPhamViewModel item : ketqua){
									String anhSp = daodp.Lay1AnhSanPham(item.getId());
							%>
							<!-- product -->
							<div class="col-md-4 col-xs-6">
							
								<div class="product">
									<div class="product-img">
										<img src="./img/products/<%=anhSp%>" alt="Ảnh sản phẩm">
										
									</div>
									<div class="product-body">
										
										<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id=<%=item.getId()%>"><%=item.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(item.getGia()) %> <del class="product-old-price"><%=formatter.format(item.getGia() + 590000) %></del></h4>
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
											<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem Ngay</span></button>
										</div>
									</div>
									<div class="add-to-cart">
										<button id="btnAddtoCart" class="add-to-cart-btn" data-id="<%=item.getId()%>"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ</button>
									</div>
								</div>
								
							</div>
								<%
									}
								%>
							<!-- /product -->

							
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty" style="font-size: 15px">Hiển thị từ <strong style="color: red"><%=Start%></strong> đến <strong style="color: red"><%=End%></strong> trên tổng số <strong style="color: red"><%=resultNumber%></strong> kết quả</span>
							
							<%

								int totalPage = resultNumber / pageSize;
								if(resultNumber % pageSize != 0){
									totalPage = totalPage + 1;
								}
								
								int pagePrev= 0;
								if(pageIndex > 1){
									pagePrev = pageIndex -1; 
								}else{
									pagePrev = totalPage;
								}
							%>
							
							
							
							<ul class="store-pagination">
								<li><a href="TimKiem.jsp?pageIndex=<%=pagePrev%>"><i class="fa fa-angle-left"></i></a></li>
							
								<%
									for(int i = 1; i <= totalPage; i++){
										if(i == pageIndex){
										
								%>
									<li class="active"><%=i %></li>
								<%								
										}
										else
										{	
								%>
									<li><a href="TimKiem.jsp?pageIndex=<%=i%>"> <%=i %></a></li>
								<%
										}
									}
								%>
								
								<%
									int pageNext = 0;
									if(pageIndex < totalPage){
										pageNext = pageIndex +1;
									}else{
										pageNext = 1;
									}
								%>
								
								<li><a href="TimKiem.jsp?pageIndex=<%=pageNext%>"><i class="fa fa-angle-right"></i></a></li>
								
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