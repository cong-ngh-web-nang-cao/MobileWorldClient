

$(document).ready(function(){
	LayThongTinNguoiDung();
	
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
				html += '<a href="#"><i class="fa fa-user-o"></i> '+thongtin.Ten+'</a>'
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


