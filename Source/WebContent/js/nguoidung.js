

$(document).ready(function(){
	LayThongTinNguoiDung();
	LayThongTinNguoiDung2();
	TaoTaiKhoan();
	CapNhatThongTinTaiKhoan();
	CapNhatThongTinTaiKhoan2();
	DangNhap2();
	
	
	$('#btnDangNhap').click(function() {
		var kieudangnhap = $('#kieudangnhap').val();
		var matkhau = $('#matkhau').val();
		
		$.ajax({
			type: "POST",
			url: "DangNhap",
			
			data: {kieudangnhap: kieudangnhap, matkhau: matkhau},
			success: function(result){
				var thongtin = $.parseJSON(result);
				
				var html = '';
				var btnDangXuat = '';
				if(thongtin != null){
					alert("Chào bạn: "+ thongtin.Ten);
					html += '<a href="#"><i class="fa fa-user-o"></i> '+thongtin.Ten+'</a>';
					
					btnDangXuat = '<a><i class="fa fa-chevron-circle-right"></i>Đăng Xuất</a>';
					
					$('#tennguoidung').html(html);
					$('#btnDangXuat').html(btnDangXuat);
					
					window.location = "Index.jsp";
				}
				else{
					sweetAlert("Oops...", "Thông tin không chính xác!", "error");
				}
			}
				
		});
	});
	
	$('#btnDangXuat').click(function(){
		if(confirm("Bạn có muốn đăng xuất không?") == true){
			$.ajax({
				type: "GET",
				url: "DangXuat",
				
				success: function(result){	
					
					var dangnhap = '<a href="DangNhap.jsp"><i class="fa fa-user-o"></i>Đăng Nhập</a>';

					$('#tennguoidung').html(dangnhap);
					$('#btnDangXuat').html('');
					window.location = "Index.jsp";
				}
			});
        }
	});
	
	
	
})

function LayThongTinNguoiDung(){
	$.ajax({
		type : "GET",
		url : "LayThongTinNguoiDung",
		headers:{
			Accept : "application/json; charset=utf-8",
			"Content-Type" : "application/json; charset=utf-8"
		},
		
		success: function(result) {
			var thongtin = $.parseJSON(result);
			var btnDangXuat = '';
			var html = '';
			if(thongtin != null){
				html += '<a href="TrangCaNhan.jsp"><i class="fa fa-user-o"></i> '+thongtin.Ten+'</a>'
				btnDangXuat = '<a><i class="fa fa-chevron-circle-right"></i>Đăng Xuất</a>';
			}
			else{
				html += '<a href="DangNhap.jsp"><i class="fa fa-user-o"></i>Đăng Nhập</a>'
			}
			
			$('#tennguoidung').html(html);
			$('#btnDangXuat').html(btnDangXuat);
		}
	})
}


function TaoTaiKhoan() {
	$('#btnTaoTaiKhoan').click(function(){
		var sdt = $('#sdt').val();
		var matkhau = $('#matkhau').val();
		var ten = $('#ten').val();
		var email = $('#email').val();
		var diachi = $('#diachi').val();	
		
		$.ajax({
			type: "POST",
			url: "TaoTaiKhoan",
			data: {sdt: sdt, matkhau: matkhau, ten: ten, email: email, diachi: diachi},
	        success: function (result) {
	            if(result == 0){
	            	alert("Tạo tài khoản thành công! Bạn sẽ được chuyển đến màn hình đăng nhập");
	            	window.location = "DangNhap.jsp";
	            }
	            else if(result == 1){
	            	sweetAlert("Oops...", "Số điện thoại này đang được liên kết với tài khoản khác!", "error");
	            }
	            else if(result == 2){
	            	sweetAlert("Oops...", "Email đang được liên kết với tài khoản khác!", "error");
	            }
	            else{
	            	sweetAlert("Oops...", "Điện thoại và email đang được liên kết với tài khoản khác!", "error");
	            }
	        }
		});	
	});
}


//Hàm này dùng để load dữ liệu người dùng lên modal, dùng cho chức năng thay đổi thông tin tài khoản khi thực hiện đặt hàng
//Sử dụng với khách hàng đã đăng nhập

function LayThongTinNguoiDung2(){
	$.ajax({
		type : "GET",
		url : "LayThongTinNguoiDung",
		headers:{
			Accept : "application/json; charset=utf-8",
			"Content-Type" : "application/json; charset=utf-8"
		},
		
		success: function(result) {
			var thongtin = $.parseJSON(result);
			if(thongtin != null){
				$('#hovaten').val(thongtin.Ten);
				$('#dienthoai').val(thongtin.DienThoai);
				$('#email').val(thongtin.Email);
				$('#diachi').val(thongtin.DiaChi);
			}
			
		}
	});
}

function CapNhatThongTinTaiKhoan() {
	$('#btnLuu').click(function(){
		var ten = $('#hovaten').val();
		var dienthoai = $('#dienthoai').val();
		var email = $('#email').val();
		var diachi = $('#diachi').val();	
		
		$.ajax({
			type: "POST",
			url: "CapNhatThongTinCaNhan",
			data: {sdt: dienthoai, ten: ten, email: email, diachi: diachi},
	        success: function (result) {
	            if(result == 0){
	            	alert("Cập nhật thông tin thành công!")
	            	
	            	window.location = "DatHangKhachDaDangNhap.jsp";
	            }
	            else if(result == 1){
	            	sweetAlert("Oops...", "Số điện thoại này đang được liên kết với tài khoản khác!", "error");
	            }
	            else if(result == 2){
	            	sweetAlert("Oops...", "Email đang được liên kết với tài khoản khác!", "error");
	            }
	            else{
	            	sweetAlert("Oops...", "Điện thoại và email đang được liên kết với tài khoản khác!", "error");
	            }
	        }
		});	
	});
}

function CapNhatThongTinTaiKhoan2() {
	$('#btnLuuThongTin').click(function(){
		var ten = $('#hovaten').val();
		var dienthoai = $('#dienthoai').val();
		var email = $('#email').val();
		var diachi = $('#diachi').val();	
		
		$.ajax({
			type: "POST",
			url: "CapNhatThongTinCaNhan",
			data: {sdt: dienthoai, ten: ten, email: email, diachi: diachi},
	        success: function (result) {
	            if(result == 0){
	            	alert("Cập nhật thông tin thành công!")
	            	
	            	window.location = "TrangCaNhan.jsp";
	            }
	            else if(result == 1){
	            	sweetAlert("Oops...", "Số điện thoại này đang được liên kết với tài khoản khác!", "error");
	            }
	            else if(result == 2){
	            	sweetAlert("Oops...", "Email đang được liên kết với tài khoản khác!", "error");
	            }
	            else{
	            	sweetAlert("Oops...", "Điện thoại và email đang được liên kết với tài khoản khác!", "error");
	            }
	        }
		});	
	});
}


function DangNhap2(){
	$('#btnDangNhap2').click(function() {
		var kieudangnhap = $('#kieudangnhap').val();
		var matkhau = $('#matkhau').val();
		
		$.ajax({
			type: "POST",
			url: "DangNhap",
			
			data: {kieudangnhap: kieudangnhap, matkhau: matkhau},
			success: function(result){
				var thongtin = $.parseJSON(result);
				
				var html = '';
				var btnDangXuat = '';
				if(thongtin != null){
					alert("Hi "+ thongtin.Ten+ "^^");
					
					window.location = "DatHangKhachDaDangNhap.jsp";
				}
				else{
					sweetAlert("Oops...", "Thông tin không chính xác!", "error");
				}
			}
				
		});
	});
}



