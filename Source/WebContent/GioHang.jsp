<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="Models.GioHangModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ Hàng</title>
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

<!-- Custom Cart -->
<link type="text/css" rel="stylesheet" href="css/cart-custom.css"/>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <h3 class="breadcrumb-header">Giỏ Hàng</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="#">Trang chủ</a></li>
                        <li class="active">Giỏ hàng</li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->
    <!-- SECTION -->
    <div class="section">

        <div class="container">
        <%
        	HttpSession ses = request.getSession();
        	List<GioHangModel> Cart1 = (List<GioHangModel>)ses.getAttribute("Cart");
        	if(Cart1 != null && Cart1.size() > 0){
        		
        	
        %>
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:50%">Tên sản phẩm</th>
                        <th style="width:10%">Giá</th>
                        <th style="width:8%">Số lượng</th>
                        <th style="width:22%" class="text-center">Thành tiền</th>
                        <th style="width:10%"> </th>
                    </tr>
                </thead>
                <tbody>
                	<%
                		DecimalFormat formatter = new DecimalFormat("###,###,###");
                		SanPhamDAO dao = new SanPhamDAO();
                		
                	
                		int ThanhTien = 0;
                		int TongSoLuong = 0;
                		if(ses.getAttribute("Cart") != null){
                			List<GioHangModel> Cart = (List<GioHangModel>)ses.getAttribute("Cart");

                			for(GioHangModel model : Cart){
                				String anhsp = dao.Lay1AnhSanPham(model.getSanPham().getId());
                				ThanhTien = ThanhTien + model.getTongTien();
                				TongSoLuong = TongSoLuong + model.getSoLuong();
                	%>
                	
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                    <img src="./img/products/<%=anhsp %>" alt="Sản phẩm 1" class="img-responsive" width="100">
                                </div>
                                <div class="col-sm-10">
                                	<a href="/MobileWorldClient/ChiTietSanPham?id=<%=model.getSanPham().getId()%>"><h4 class="nomargin"><%=model.getSanPham().getTenSP() %></h4></a>
                                    
                                    <p><%=model.getSanPham().getDanhMuc() %></p>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price"><%=formatter.format(model.getSanPham().getGia()) %> đ</td>
                        
                        <form action="/MobileWorldClient/CapNhatSoLuong" method="post">
                        <td data-th="Quantity">
                        	<input name = "Id" value="<%=model.getSanPham().getId() %>" style="display: none" >
                            <input class="form-control text-center" value="<%=model.getSoLuong() %>" type="number" name ="SoLuongMoi">
                        </td>
                        <td data-th="Subtotal" class="text-center"><%=formatter.format(model.getTongTien()) %> đ</td>
                        <td class="actions" data-th="">
                            <button class="btn btn-success btn-sm">
                                <i class="fa fa-edit"></i>
                            </button>
						</form>
                            <a class="btn btn-danger btn-sm" href="/MobileWorldClient/XoaGioHang?id=<%=model.getSanPham().getId()%>">
                                <i class="fa fa-trash-o"></i>
                            </a>
                        </td>
                        
                    </tr>
                    <%
                			}
                		}
                    %>
                </tbody>
                <tfoot>
                    <td><a href="Index.jsp" class="btn btn-success"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
				    </td> 
				    <td colspan="2" class="hidden-xs"> <strong>Tổng Số Lượng: <%=TongSoLuong %></strong> </td> 
				    <td class="hidden-xs text-center"><strong>Tổng tiền: <%=formatter.format(ThanhTien) %> đ</strong>
				    </td> 
				    <td><a href="#" class="btn btn-danger btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
				    </td> 
                </tfoot>
            </table>
            <%
        	}else{

            %>
            <h4>Giỏ Hàng Trống!</h4>
            <%
            	} 
            %>
        </div>
    </div>
    <!-- /SECTION -->
	
	<hr>
	<jsp:include page="Section4.jsp"></jsp:include>
	
	
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>