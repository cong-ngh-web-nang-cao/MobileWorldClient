package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.ChiTietDonHangModel;
import Models.ChiTietDonHangViewModel;
import Models.ConnectDB;
import Models.DonDatHangViewModel;
import Models.DonHangModel;

public class DonHangDAO {
	Connection con = new ConnectDB().getConnect();
	
	public int DatHang(DonHangModel model) {
		String sql = "{call SP_DatHang(?,?,?,?,?)}";
		ResultSet rs = null;
		int IdDonHang = 0;
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setInt(1, model.getKhachHang());
			cs.setString(2, model.getTenKH());
			cs.setString(3, model.getDienThoai());
			cs.setString(4, model.getEmail());
			cs.setString(5, model.getDiaChi());
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				IdDonHang = rs.getInt("Id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return IdDonHang;
	}
	
	public void ThemChiTietDonHang(ChiTietDonHangModel model) {
		String sql = "{call SP_ThemChiTietDonHang(?,?,?,?)}";
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setInt(1, model.getDonHang());
			cs.setInt(2, model.getSanPham());
			cs.setInt(3, model.getSoLuong());
			cs.setInt(4, model.getThanhTien());
			
			cs.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<DonDatHangViewModel> DonHangCuaBan(int NguoiDung){
		String sql = "{call SP_DonHangCuaBan(?)}";
		ResultSet rs = null;
		
		List<DonDatHangViewModel> list = new ArrayList<DonDatHangViewModel>();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, NguoiDung);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				DonDatHangViewModel item = new DonDatHangViewModel();
				item.setIdDonHang(rs.getInt("Id"));
				item.setNgayDat(rs.getDate("NgayDat"));
				item.setDienThoai(rs.getString("DienThoai"));
				item.setEmail(rs.getString("Email"));
				item.setTen(rs.getString("Ten"));
				item.setDiaChi(rs.getString("DiaChi"));
				item.setTinhTrangDon(rs.getInt("TinhTrangDon"));
				
				list.add(item);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public List<ChiTietDonHangViewModel> ChiTietDonHang(int IdDonHang){
		String sql = "{call SP_ChiTietDonHang(?)}";
		ResultSet rs = null;
		
		List<ChiTietDonHangViewModel> list = new ArrayList<ChiTietDonHangViewModel>();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, IdDonHang);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				ChiTietDonHangViewModel item = new ChiTietDonHangViewModel();
				item.setIdSanPham(rs.getInt("Id"));
				item.setTenSP(rs.getString("TenSP"));
				item.setGia(rs.getInt("Gia"));
				item.setSoLuong(rs.getInt("SoLuong"));
				item.setThanhTien(rs.getInt("ThanhTien"));
				
				list.add(item);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	public DonDatHangViewModel LayDonHangTheoId(int idDonHang){
		String sql = "{call SP_LayDonHangTheoId(?)}";
		ResultSet rs = null;
		
		DonDatHangViewModel don = new DonDatHangViewModel();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idDonHang);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				don.setIdDonHang(rs.getInt("Id"));
				don.setNgayDat(rs.getDate("NgayDat"));
				don.setDienThoai(rs.getString("DienThoai"));
				don.setEmail(rs.getString("Email"));
				don.setTen(rs.getString("Ten"));
				don.setDiaChi(rs.getString("DiaChi"));
				don.setTinhTrangDon(rs.getInt("TinhTrangDon"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return don;
	}
	
	//Hàm này lấy số lượng đơn hàng chưa nhận của người dùng
	public int LaySoLuongDonHang(int IdNguoiDung) {
		String sql = "{call SP_LaySoLuongDonHang(?)}";
		ResultSet rs = null;
		int soluong = 0;
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, IdNguoiDung);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				soluong = rs.getInt("SoLuongDonHang");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return soluong;
	}
	
	
	
	
	
	
	
	
	
	
}
