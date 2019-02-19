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
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">SamSung</h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-3">
							<div>
							<%
								DecimalFormat formatter = new DecimalFormat("###,###,###");
							
								SanPhamDAO dao = new SanPhamDAO();
								List<SanPhamViewModel> list = dao.SanPhamTheoHang(1);
								
								for(int i=0; i< 3; i++){
									SanPhamViewModel model = list.get(i);
									
									String anhsp = dao.Lay1AnhSanPham(model.getId());
								
							%>
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/products/<%=anhsp %>" alt="">
									</div>
									<div class="product-body">
										<p class="product-category"><%=model.getDanhMuc() %></p>
										<h3 class="product-name"><a href="#"><%=model.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(model.getGia()) %> <del class="product-old-price"><%=formatter.format(model.getGia()+ 560000) %></del></h4>
									</div>
								</div>
								<!-- /product widget -->	
								<%
									}
								%>
							</div>
							<div>
								<%
									for(int i=3; i< 6; i++){
									SanPhamViewModel model = list.get(i);
									
									String anhsp = dao.Lay1AnhSanPham(model.getId());	
								%>
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/products/<%=anhsp %>" alt="">
									</div>
									<div class="product-body">
										<p class="product-category"><%=model.getDanhMuc() %></p>
										<h3 class="product-name"><a href="#"><%=model.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(model.getGia()) %> <del class="product-old-price"><%=formatter.format(model.getGia()+ 560000) %></del></h4>
									</div>
								</div>
								<!-- /product widget -->	
								<%
									}
								%>
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Apple</h4>
							<div class="section-nav">
								<div id="slick-nav-4" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-4">
							<div>
								<%
								//DecimalFormat formatter1 = new DecimalFormat("###,###,###");
							
								SanPhamDAO dao1 = new SanPhamDAO();
								List<SanPhamViewModel> list1 = dao.SanPhamTheoHang(2);
								
								for(int i=0; i< 3; i++){
									SanPhamViewModel model = list1.get(i);
									
									String anhsp = dao1.Lay1AnhSanPham(model.getId());
								
								%>
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/products/<%=anhsp %>" alt="">
									</div>
									<div class="product-body">
										<p class="product-category"><%=model.getDanhMuc() %></p>
										<h3 class="product-name"><a href="#"><%=model.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(model.getGia()) %> <del class="product-old-price"><%=formatter.format(model.getGia()+ 560000) %></del></h4>
									</div>
								</div>
								<!-- /product widget -->	
								<%
									}
								%>
							</div>

							<div>
								<%
								for(int i=3; i< 5; i++){
									SanPhamViewModel model = list1.get(i);
									
									String anhsp = dao1.Lay1AnhSanPham(model.getId());
								
								%>
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/products/<%=anhsp %>" alt="">
									</div>
									<div class="product-body">
										<p class="product-category"><%=model.getDanhMuc() %></p>
										<h3 class="product-name"><a href="#"><%=model.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(model.getGia()) %> <del class="product-old-price"><%=formatter.format(model.getGia()+ 560000) %></del></h4>
									</div>
								</div>
								<!-- /product widget -->	
								<%
									}
								%>
							</div>
						</div>
					</div>

					<div class="clearfix visible-sm visible-xs"></div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Huawei</h4>
							<div class="section-nav">
								<div id="slick-nav-5" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-5">
							
							<div>
								<%
								//DecimalFormat formatter1 = new DecimalFormat("###,###,###");
							
								List<SanPhamViewModel> list2 = dao.SanPhamTheoHang(6);
								
								for(int i=0 ; i< 3; i++){
									SanPhamViewModel model = list2.get(i);
									
									String anhsp = dao1.Lay1AnhSanPham(model.getId());
								
								%>
								<!-- product widget -->
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/products/<%=anhsp %>" alt="">
									</div>
									<div class="product-body">
										<p class="product-category"><%=model.getDanhMuc() %></p>
										<h3 class="product-name"><a href="#"><%=model.getTenSP() %></a></h3>
										<h4 class="product-price"><%=formatter.format(model.getGia()) %> <del class="product-old-price"><%=formatter.format(model.getGia()+ 560000) %></del></h4>
									</div>
								</div>
								<!-- /product widget -->	
								<%
									}
								%>
							</div>
							
						</div>
					</div>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->