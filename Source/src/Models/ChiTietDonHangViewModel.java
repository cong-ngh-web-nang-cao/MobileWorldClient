package Models;

public class ChiTietDonHangViewModel {
	private  int IdSanPham;
	private String TenSP;
	private int SoLuong;
	private int Gia;
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	private int ThanhTien;
	
	public int getIdSanPham() {
		return IdSanPham;
	}
	public void setIdSanPham(int idSanPham) {
		IdSanPham = idSanPham;
	}
	public String getTenSP() {
		return TenSP;
	}
	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public int getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(int thanhTien) {
		ThanhTien = thanhTien;
	}
	
	
}
