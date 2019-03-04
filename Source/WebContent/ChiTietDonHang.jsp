<%@page import="DAO.SanPhamDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.ChiTietDonHangViewModel"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Models.DonDatHangViewModel"%>
<%@page import="Models.NguoiDungModel"%>
<%@page import="DAO.DonHangDAO"%>
<%@page import="Models.DonHangModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi Tiết Đơn Hàng</title>
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
                    <h3 class="breadcrumb-header">Chi Tiết Đơn Hàng</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="Index.jsp">Trang chủ</a></li>
                        <li><a href="DonHangCuaBan.jsp">Đơn Hàng</a></li>
                        <li class="active">Chi Tiết Đơn hàng</li>
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
        <h4 style="color: red">Đơn Hàng</h4>
        <%
        SimpleDateFormat formattt = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat formatter = new DecimalFormat("###,###,###");

        int IdDonHang =  Integer.parseInt((String)request.getParameter("idDonHang"));
        
		DonHangDAO dao = new DonHangDAO();
		DonDatHangViewModel don = dao.LayDonHangTheoId(IdDonHang);
		
		if(don!=null)
		{
		%>
            <table class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:16%">Ngày Đặt Hàng</th>
                        <th style="width:16%">Tên Khách Hàng</th>
                        <th style="width:10%">Điện Thoại</th>
                        <th style="width:24%" class="text-center">Địa Chỉ</th> 
                        <th style="width:14%">Trạng Thái</th>
                        <th style="width:8%"> </th>
                    </tr>
                </thead>
                <tbody>     
                    <tr>
                    <%	
                    	String strDate = formattt.format(don.getNgayDat());                   	
                    %>
                        <td><%=strDate %></td>
                        <td ><%=don.getTen() %></td>
                        <td ><%=don.getDienThoai() %></td>
                        <td class="text-center"><%=don.getDiaChi() %></td>
                        <td >
                            <%
                            	if(don.getTinhTrangDon() == 1){
                            		
                            	
                            %>
                            	Đã giao hàng
                            <%
                            	}
                            	else{                         	
                            %>
                            <strong style="color:red">Chờ nhận hàng</strong>
                            <%
                            	}
                            %>
                        </td>
                        
                    </tr>
                    <%
                    }
        			%>
    
                </tbody>
                
            </table>
       	
        </div>   
    </div>
    <!-- /SECTION -->
    
    
    <!-- SECTION -->
    <div class="section">
        <div class="container">
        <h4 style="color: red">Chi tiết đơn hàng </h4>
        <%  
        SanPhamDAO dao1 = new SanPhamDAO();
        //String strDate = formattt.format(item.getNgayDat());  

        
        int TongSoLuong = 0;
    	//Tính tổng tiền đơn hàng
    	int tongtien = 0;
    	List<ChiTietDonHangViewModel> chitiet = dao.ChiTietDonHang(IdDonHang);
		%>
            <table class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:40%">Tên sản phẩm</th>
                        <th style="width:30%">Giá</th>
                        <th style="width:15%">Số lượng</th>
                        <th style="width:15%">Thành tiền</th>
                        
                    </tr>
                </thead>
                <tbody>
                <%
                	
        			
        			for(ChiTietDonHangViewModel item : chitiet){
        				tongtien = tongtien + item.getThanhTien();
        				TongSoLuong = TongSoLuong + item.getSoLuong();
        				String anhsp = dao1.Lay1AnhSanPham(item.getIdSanPham());
                %>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-2 hidden-xs">
                                    <img src="./img/products/<%=anhsp%>" alt="Sản phẩm 1" class="img-responsive" width="100">
                                </div>
                                <div class="col-sm-10">
                                	<a href="/MobileWorldClient/ChiTietSanPham?id=<%=item.getIdSanPham()%>"><h4 class="nomargin"><%=item.getTenSP() %></h4></a>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price"><%=formatter.format(item.getGia()) %> VNĐ</td>
                        
                        <td><%=item.getSoLuong() %></td>
                        <td><%=formatter.format(item.getThanhTien()) %></td> 
                    </tr>
                    
                    <%
                    }
        			%>
    
                </tbody>
                <tfoot >
                    <td><a href="DonHangCuaBan.jsp" class="primary-btn cta-btn"><i class="fa fa-angle-left"></i> Quay lại đơn hàng</a></td> 
                    
				    <td colspan="2" class="hidden-xs"> <strong>Tổng Số Lượng: <%=TongSoLuong %></strong> </td> 
				    <td class="hidden-xs text-center"><strong>Tổng tiền: <%=formatter.format(tongtien) %> VNĐ</strong>
				    
                </tfoot>
            </table>
        
		
        </div>   
    </div>
    <!-- /SECTION -->

	<jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>