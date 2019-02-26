
$(document).ready(function(){
	loadGioHang();
	$('.add-to-cart-btn').click(function(){
		var id = $(this).attr("data-id");
		var soluong = $('#txtSoLuong').val();

		$.ajax({
			type: 'POST',
			url: 'ThemGioHang',
			data:{idsp : id , soluongsp : soluong},
			success: function(result){
				var kq = $.parseJSON(result);
				var html = '';
				var sosanpham = 0;
				var tongtien = 0;
				
				html += '<div class="cart-list">';	
				for(var i=0; i<kq.length; i++){
					html += '<div class="product-widget">';
					html += '<div class="product-img">';
					html += '<img src="./img/products/'+kq[i].Anh+'" alt="">';
					html += '</div>';
					html += '<div class="product-body">';
					html += '<h3 class="product-name"><a href="#">' + kq[i].SanPham.TenSP +'</a></h3>';
					html += '<h4 class="product-price"><span class="qty">' + kq[i].SoLuong +'x</span> '+ kq[i].SanPham.Gia +' </h4>';
					html += '</div>';
					html += '<button class="delete" id="btnXoa" data-id="'+kq[i].SanPham.Id+'"><i class="fa fa-close"></i></button>';
					html += '</div>';
					
					sosanpham += kq[i].SoLuong;
					tongtien += kq[i].SoLuong * kq[i].SanPham.Gia;	
				}
				html += '</div>';
				html += '<div class="cart-summary">';
				html += '<p> '+sosanpham+ ' sản phẩm</p>';
				html += '<h5>Tổng Tiền: '+tongtien+' VNĐ</h5>';
				html += '</div>';
				html += '<div class="cart-btns">';
				html += '<a href="GioHang.jsp">Chi Tiết</a>';
				html += '<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>';
				html += '</div>';
				
				$('#cartInfo').html(html);
				$('#sosanpham').html(sosanpham);
				
				swal("", "Đã Thêm Vào Giỏ Hàng!", "success");
			}
		});
	});	
	
		
	
});

function loadGioHang(){
	$.ajax({
		type: 'GET',
		url: 'LoadGioHang',
		headers:{
			Accept : "application/json; charset=utf-8",
			"Content-Type" : "application/json; charset=utf-8"
		},
		success: function(result){
			var kq = $.parseJSON(result);
			var html = '';
			var sosanpham = 0;
			var tongtien = 0;
			
			if(kq != null && kq.length > 0){
				html += '<div class="cart-list">';	
				for(var i=0; i<kq.length; i++){
					html += '<div class="product-widget">';
					html += '<div class="product-img">';
					html += '<img src="./img/products/'+kq[i].Anh+'" alt="Ảnh SP">';
					html += '</div>';
					html += '<div class="product-body">';
					html += '<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id='+kq[i].SanPham.Id+'">' + kq[i].SanPham.TenSP +'</a></h3>';
					html += '<h4 class="product-price"><span class="qty">' + kq[i].SoLuong +'x</span> '+ kq[i].SanPham.Gia +' </h4>';
					html += '</div>';
					html += '<button onclick="XoaGioHang()" class="delete" data-id="'+kq[i].SanPham.Id+'"><i class="fa fa-close"></i></button>';
					html += '</div>';
					
					sosanpham += kq[i].SoLuong;
					tongtien += kq[i].SoLuong * kq[i].SanPham.Gia;	
				}
				html += '</div>';
				html += '<div class="cart-summary">';
				html += '<p> '+sosanpham+ 'sản phẩm</p>';
				html += '<h5>Tổng Tiền: '+tongtien+' VNĐ</h5>';
				html += '</div>';
				html += '<div class="cart-btns">';
				html += '<a href="GioHang.jsp">Chi Tiết</a>';
				html += '<a class="btnChiTiet" href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>';
				html += '</div>';
			}
			else
			{
				html = "<h5>Giỏ Hàng Trống</h5>";
			}
			
			$('#cartInfo').html(html);
			$('#sosanpham').html(sosanpham);
		}
	});
};

	$(".delete").click(function(){
		var id = 1;
		$.ajax({
			type: 'POST',
			url: 'XoaGioHang',
			data: {idsp : id},
			
			success: function(result){
				alert("???");
				loadGioHang();
			}
		});
	});





















