package Models;

import java.sql.Date;

public class DonHangModel {
	private int Id;
	private int KhachHang;
	private int NguoiLap;
	private Date NgayDat;
	private Date NgayXuat;
	private String TenKH;
	private String DienThoai;
	private String Email;
	private String DiaChi;
	private int TinhTrangDon;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getKhachHang() {
		return KhachHang;
	}
	public void setKhachHang(int khachHang) {
		KhachHang = khachHang;
	}
	public int getNguoiLap() {
		return NguoiLap;
	}
	public void setNguoiLap(int nguoiLap) {
		NguoiLap = nguoiLap;
	}
	public Date getNgayDat() {
		return NgayDat;
	}
	public void setNgayDat(Date ngayDat) {
		NgayDat = ngayDat;
	}
	public Date getNgayXuat() {
		return NgayXuat;
	}
	public void setNgayXuat(Date ngayXuat) {
		NgayXuat = ngayXuat;
	}
	public String getTenKH() {
		return TenKH;
	}
	public void setTenKH(String tenKH) {
		TenKH = tenKH;
	}
	public String getDienThoai() {
		return DienThoai;
	}
	public void setDienThoai(String dienThoai) {
		DienThoai = dienThoai;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public int getTinhTrangDon() {
		return TinhTrangDon;
	}
	public void setTinhTrangDon(int tinhTrangDon) {
		TinhTrangDon = tinhTrangDon;
	}
	
	
	
}
