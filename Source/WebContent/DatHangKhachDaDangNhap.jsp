<%@page import="Models.NguoiDungModel"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Models.GioHangModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đặt hàng</title>
<link rel="icon" href="img/icon-mobile.png" type="image/gif">
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<link type="text/css" rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css" />

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
					<h3 class="breadcrumb-header">Đặt Hàng</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Trang Chủ</a></li>
						<li class="active">Đặt Hàng</li>
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
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">THÔNG TIN CÁ NHÂN</h3>
						</div>

						<%
							HttpSession ses = request.getSession();

							NguoiDungModel nguoidung = (NguoiDungModel) session.getAttribute("NguoiDung");
						%>
						<div class="row" style="font-size: medium;">
							<div style="padding-left: 0px;" class="col-md-12">
								<div class="col-md-12" style="margin-top: 10px">
									<div class="col-md-4">
										<strong>Họ Và Tên</strong>
									</div>
									<div class="col-md-5"><%=nguoidung.getTen()%></div>
								</div>
								<div class="col-md-12" style="margin-top: 10px">
									<div class="col-md-4">
										<strong>Điện Thoại:</strong>
									</div>
									<div class="col-md-5"><%=nguoidung.getDienThoai()%></div>
								</div>
								<div class="col-md-12" style="margin-top: 10px">
									<div class="col-md-4">
										<strong>Email:</strong>
									</div>
									<div class="col-md-5"><%=nguoidung.getEmail()%></div>
								</div>
								<div class="col-md-12" style="margin-top: 10px">
									<div class="col-md-4">
										<strong>Địa chỉ nhận hàng:</strong>
									</div>
									<div class="col-md-7"><%=nguoidung.getDiaChi()%></div>
								</div>

								<div class="col-md-12" style="margin-top: 20px">
									<div class="col-md-8">
										<button data-toggle="modal" data-target="#myModal"
											class="primary-btn">Đổi thông tin</button>
									</div>

								</div>
							</div>

						</div>

					</div>
					<!-- /Billing Details -->
				</div>

				<!-- Order Details -->
				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title">Đơn Hàng</h3>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong>Sản Phẩm</strong>
							</div>
							<div>
								<strong>Tổng Tiền</strong>
							</div>
						</div>
						<div class="order-products">
							<%
								DecimalFormat formatter = new DecimalFormat("###,###,###");

								List<GioHangModel> model = (List<GioHangModel>) ses.getAttribute("Cart");

								int tongtien = 0;

								if (model != null) {
									for (GioHangModel item : model) {
										tongtien = tongtien + item.getTongTien();
							%>
							<div class="order-col">
								<div><%=item.getSoLuong()%>x
									<%=item.getSanPham().getTenSP()%></div>
								<div><%=formatter.format(item.getTongTien())%></div>
							</div>
							<%
								}
								}
							%>

						</div>
						<div class="order-col">
							<div>Shiping</div>
							<div>
								<strong>FREE</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>Thành Tiền</strong>
							</div>
							<div>
								<strong class="order-total"><%=formatter.format(tongtien)%></strong>
							</div>
						</div>
					</div>
					<div class="payment-method">
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1"> <label
								for="payment-1"> <span></span> COD
							</label>
							<div class="caption">
								<p>Cách ship COD là dịch vụ giao hàng thu tiền hộ kèm theo
									cho người gửi khi sử dụng các dịch vụ chuyển phát giao hàng cho
									người nhận. Với dịch vụ này, công ty dịch vụ vận tải sẽ thay
									người gửi thu hộ tiền hàng của khách sau khi người nhận đã đồng
									ý nhận hàng. Sau đó tiền hàng thanh toán hộ được đơn vị vận tải
									hoàn lại cho người gửi theo thỏa thuận giữa 2 bên cùng chi phí
									thu tiền hộ</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2"> <label
								for="payment-2"> <span></span> Ví MoMo
							</label>
							<div class="caption">
								<p>MOMO là một ví điện tử trên các thiết bị di động cho phép
									mọi người có thể nạp tiền, chuyển tiền hay thực hiện giao dịch
									mua bán cực nhanh qua điện thoại di động</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-3"> <label
								for="payment-3"> <span></span> Paypal
							</label>
							<div class="caption">
								<p>PayPal là một công cụ thanh toán trực tuyến, hoạt động
									như là một dịch vụ trung gian trong chuyển tiền quốc tế để giúp
									bạn nhận chi trả từ tài khoản nước ngoài về ngân hàng nội địa
									hoặc thanh toán khi mua sắm trực tuyến.</p>
							</div>
						</div>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms"> <label for="terms">
							<span></span> Tôi đã đọc và đồng ý với <a
							href="DieuKhoanKhiMuaHang.jsp" style="color: red">Điều khoản
								& Chính Sách</a>
						</label>
					</div>
					<a id="btnDatHang" class="primary-btn order-submit"
						style="display: none">Đặt Hàng</a>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Thay đổi thông tin tài khoản</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="makt">Họ Và Tên</label> <input type="text"
							class="form-control" id="hovaten" placeholder="Họ Và Tên">
					</div>
					<div class="form-group">
						<label for="makt">Điện Thoại</label> <input type="text"
							class="form-control" id="dienthoai" placeholder="Điện Thoại">
					</div>
					<div class="form-group">
						<label for="makt">Email</label> <input type="text"
							class="form-control" id="email" placeholder="Email">
					</div>
					<div class="form-group">
						<label for="makt">Địa Chỉ</label> <input type="text"
							class="form-control" id="diachi" placeholder="Địa Chỉ">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					<button type="button" id="btnLuu" class="btn btn-danger">Lưu
						Thay Đổi</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>