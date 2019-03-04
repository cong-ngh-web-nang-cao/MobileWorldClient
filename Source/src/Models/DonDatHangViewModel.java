package Models;

import java.sql.Date;

public class DonDatHangViewModel {
	private int IdDonHang;
	private Date NgayDat;
	private String Ten;
	private String DienThoai;
	private String DiaChi;
	private String Email;
	private int TinhTrangDon;
	
	public int getIdDonHang() {
		return IdDonHang;
	}
	public void setIdDonHang(int idDonHang) {
		IdDonHang = idDonHang;
	}
	
	public Date getNgayDat() {
		return NgayDat;
	}
	public void setNgayDat(Date ngayDat) {
		NgayDat = ngayDat;
	}
	public String getTen() {
		return Ten;
	}
	public void setTen(String ten) {
		Ten = ten;
	}
	public String getDienThoai() {
		return DienThoai;
	}
	public void setDienThoai(String dienThoai) {
		DienThoai = dienThoai;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getTinhTrangDon() {
		return TinhTrangDon;
	}
	public void setTinhTrangDon(int tinhTrangDon) {
		TinhTrangDon = tinhTrangDon;
	}
	
	
}
