package Models;

public class GioHangModel {
	private SanPhamViewModel SanPham;
	private int SoLuong;
	private int TongTien;
	
	public void setSanPham(SanPhamViewModel sanpham) {
		this.SanPham = sanpham;
	}
	
	public SanPhamViewModel getSanPham() {
		return SanPham;
	}
	
	
	public void setSoLuong(int soluong) {
		this.SoLuong = soluong;
	}
	
	public int getSoLuong() {
		return SoLuong;
	}
	
	
	public void setTongTien() {
		this.TongTien = SanPham.getGia() * SoLuong;
	}
	
	public int getTongTien() {
		return TongTien;
	}
}
