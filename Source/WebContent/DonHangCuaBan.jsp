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
<title>Đơn Hàng Của Bạn</title>
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
                    <h3 class="breadcrumb-header">Đơn Hàng</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="#">Trang chủ</a></li>
                        <li class="active">Đơn hàng</li>
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
        SimpleDateFormat formattt = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        HttpSession ses = request.getSession();
        int idNguoiDung = 0;
        NguoiDungModel nguoidung = (NguoiDungModel)ses.getAttribute("NguoiDung");
        
        if(nguoidung != null){
        	idNguoiDung = nguoidung.getId();
        }
        
		DonHangDAO dao = new DonHangDAO();
		List<DonDatHangViewModel> list = dao.DonHangCuaBan(idNguoiDung);
		
		if(list.size() > 0)
		{
		%>
            <table class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width:16%">Ngày Đặt Hàng</th>
                        <th style="width:16%">Tên Khách Hàng</th>
                        <th style="width:10%">Điện Thoại</th>
                        <th style="width:24%" class="text-center">Địa Chỉ</th>
                        <th style="width:12%">Tổng Tiền</th>
                        <th style="width:14%">Trạng Thái</th>
                        <th style="width:8%"> </th>
                    </tr>
                </thead>
                <tbody>
                <%
                	
        			
        			for(DonDatHangViewModel item : list){
                %>
                    <tr>
                    <%	
                    	String strDate = formattt.format(item.getNgayDat());                   	
                    	//Tính tổng tiền đơn hàng
                    	int tongtien = 0;
                    	List<ChiTietDonHangViewModel> chitiet = dao.ChiTietDonHang(item.getIdDonHang());
						for(ChiTietDonHangViewModel itemChiTiet : chitiet){
							tongtien = tongtien + itemChiTiet.getThanhTien();
						}
                    %>
                        <td><%=strDate %></td>
                        <td ><%=item.getTen() %></td>
                        <td ><%=item.getDienThoai() %></td>
                        <td class="text-center"><%=item.getDiaChi() %></td>
                        <td ><%=formatter.format(tongtien) %> VNĐ</td>
                        <td >
                            <%
                            	if(item.getTinhTrangDon() == 1){
                            		
                            	
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
                        <td class="actions">  
                            <a class="btn btn-danger btn-sm" href="ChiTietDonHang.jsp?idDonHang=<%=item.getIdDonHang()%>">
                                <i class="fa fa-info"></i>  
                            </a>
                            
                        </td>
                    </tr>
                    <%
                    }
        			%>
    
                </tbody>
                
            </table>
        <%
		}
		else{	
        %>
        	<span>Bạn chưa có đơn hàng nào!</span>
        <%
			}
        %>
        </div>   
    </div>
    <!-- /SECTION -->

	<jsp:include page="Footer.jsp"></jsp:include>
    
</body>
</html>