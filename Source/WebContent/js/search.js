

$(document).ready(function(){
	$('.checkbox1').click(function(){
		var sql = '';
		var dkDanhMuc = '';
		var dkNSX = '';
		var dkGia = ''; 
		
		var chuhienthi = '';
		
		//Điều kiện về danh mục
		if($('#cbDienThoai').prop("checked") == true){
			if(dkDanhMuc != ''){
				dkDanhMuc += ' OR DanhMuc = 1';
				chuhienthi += ", Điện Thoại";
			}
			else{
				dkDanhMuc += 'DanhMuc = 1';
				chuhienthi += " Điện Thoại ";
			}
		}
		
		if($('#cbMayTinhBang').prop("checked") == true){
			if(dkDanhMuc != ''){
				dkDanhMuc += ' OR DanhMuc = 2';
				chuhienthi += ", Máy Tính Bảng ";
			}
			else{
				dkDanhMuc += 'DanhMuc = 2';
				chuhienthi += " Máy Tính Bảng ";
			}
		}
		
		//Điều kiện về hãng sản xuất
		if($('#cbSamSung').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 1';
				chuhienthi += ", SamSung ";
			}
			else{
				dkNSX += 'NhaSanXuat = 1';
				chuhienthi += " SamSung ";
			}
		}
		
		if($('#cbApple').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 2';
				chuhienthi += ", Apple ";
			}
			else{
				dkNSX += 'NhaSanXuat = 2';
				chuhienthi += " Apple ";
			}
		}
		
		if($('#cbXiaomi').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 3';
				chuhienthi += ", Xiaomi ";
			}
			else{
				dkNSX += 'NhaSanXuat = 3';
				chuhienthi += " Xiaomi ";
			}
		}
		
		if($('#cbNokia').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 4';
				chuhienthi += ", Nokia ";
			}
			else{
				dkNSX += 'NhaSanXuat = 4';
				chuhienthi += " Nokia ";
			}
		}
		
		if($('#cbOppo').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 5';
				chuhienthi += ", Oppo ";
			}
			else{
				dkNSX += 'NhaSanXuat = 5';
				chuhienthi += " Oppo ";
			}
		}
		
		if($('#cbHuawei').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 6';
				chuhienthi += ", Huawei ";
			}
			else{
				dkNSX += 'NhaSanXuat = 6';
				chuhienthi += " Huawei ";
			}
		}
		
		if($('#cbAsus').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 7';
				chuhienthi += ", Asus ";
			}
			else{
				dkNSX += 'NhaSanXuat = 7';
				chuhienthi += " Asus ";
			}	
		}
		
		if($('#cbViVo').prop("checked") == true){
			if(dkNSX != ''){
				dkNSX += ' OR NhaSanXuat = 8';
				chuhienthi += ", ViVo ";
			}
			else{
				dkNSX += 'NhaSanXuat = 8';
				chuhienthi += " ViVo ";
			}
		}

		// Điều kiện về giá
		if($('#cb3').prop('checked') == true){
			if(dkGia != ''){
				dkGia += ' OR Gia < 3000000';
				chuhienthi += ", Giá nhỏ hơn 3 triệu ";
			}
			else{
				dkGia += 'Gia < 3000000';
				chuhienthi += " Giá nhỏ hơn 3 triệu ";
			}	
		}
		
		if($('#cb35').prop('checked') == true){
			if(dkGia != ''){
				dkGia += ' OR Gia BETWEEN 3000000 AND 5000000';
				chuhienthi += ", Giá từ 3-5 triệu ";
			}
			else{
				dkGia += 'Gia BETWEEN 3000000 AND 5000000';
				chuhienthi += " Giá từ 3-5 triệu ";
			}	
		}
		
		if($('#cb510').prop('checked') == true){
			if(dkGia != ''){
				dkGia += ' OR Gia BETWEEN 5000000 AND 10000000';
				chuhienthi += ", Giá từ 5-10 triệu ";
			}
			else{
				dkGia += 'Gia BETWEEN 5000000 AND 10000000';
				chuhienthi += " Giá từ 5-10 triệu ";
			}
		}
		
		if($('#cb1020').prop('checked') == true){
			if(dkGia != ''){
				dkGia += ' OR Gia BETWEEN 10000000 AND 20000000';
				chuhienthi += ", Giá từ 10-20 triệu ";
			}
			else{
				dkGia += 'Gia BETWEEN 10000000 AND 20000000';
				chuhienthi += " Giá từ 10-20 triệu ";
			}
		}
		
		if($('#cb20').prop('checked') == true){
			if(dkGia != ''){
				dkGia += ' OR Gia > 20000000';
				chuhienthi += ", Giá lớn hơn 20 triệu ";
			}
			else{
				dkGia += 'Gia > 20000000';
				chuhienthi += " Giá lớn hơn 20 triệu ";
			}	
		}
		
		//Điều kiện tổng hợp
		if(dkDanhMuc != ''){
			if(sql != ''){
				sql += ' AND (' + dkDanhMuc + ')';
			}
			else{
				sql += ' (' + dkDanhMuc + ')';
			}
		}
		if(dkNSX != ''){
			if(sql != ''){
				sql += ' AND (' + dkNSX + ')';
			}
			else{
				sql += ' (' + dkNSX + ')';
			}
			
		}
		if(dkGia != ''){
			if(sql != ''){
				sql += ' AND (' + dkGia + ')';
			}
			else{
				sql += ' (' + dkGia + ')';
			}
			
		};
		
		$.ajax({
			type: 'POST',
			url: 'LocSanPham',
			data:{sql : sql},
			success: function(result){
				var kq = $.parseJSON(result);
				
				var html = '';
				for(var i=0; i<kq.length; i++){
					html += '<div class="col-md-4 col-xs-6">';
					html += '<div class="product">';
					html += '<div class="product-img">';
					html += '<img src="./img/products/'+kq[i].Anh+'" alt="AnhSP">';
					html += '</div>';
					html += '<div class="product-body">';
					html += '<h3 class="product-name"><a href="/MobileWorldClient/ChiTietSanPham?id='+kq[i].Id+'">'+kq[i].TenSP+'</a></h3>';
					html += '<h4 class="product-price">'+kq[i].Gia+' VNĐ </h4>';
					html += '<div class="product-rating"> <i class="fa fa-star"></i> <i class="fa fa-star"> </i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i></div>';
					html += '<div class="product-btns"><button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu Thích</span></button><button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So Sánh</span></button><button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Chi Tiết</span></button></div>';
					html += '</div>';
					html += '<div class="add-to-cart">';
					html += '<button id="btnAddtoCart" class="add-to-cart-btn" data-id="<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i>Thêm Vào Giỏ</button>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
				}
				
				$('#ketquatimkiem').html(html);
				$('#phantrang').html('');
			}
				
		});
		
		
		$('#hienthi').html(chuhienthi);
	})
	
	
})
