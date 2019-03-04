package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import Models.ConnectDB;
import Models.NguoiDungModel;

public class NguoiDungDAO {
	
	Connection con = ConnectDB.getConnect();
	
	public boolean DangNhap(String kieuDangNhap, String matKhau) {
		ResultSet rs = null;
		int ketqua = 0;
		String sql = "{call SP_DangNhap(?,?)}";
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setString(1, kieuDangNhap);
			cs.setString(2, matKhau);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				ketqua = rs.getInt("KetQua");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ketqua == 1) return true;
		return false;
	}
	
	public NguoiDungModel LayThongTinNguoiDung(String kieudangnhap) {
		ResultSet rs = null;
		NguoiDungModel model = new NguoiDungModel();
		String sql = "{call SP_LayThongTinNguoiDung(?)}";
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setString(1, kieudangnhap);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				model.setId(rs.getInt("Id"));
				model.setDienThoai(rs.getString("DienThoai"));
				model.setMatKhau(rs.getString("MatKhau"));
				model.setTen(rs.getString("Ten"));
				model.setEmail(rs.getString("Email"));
				model.setDiaChi(rs.getString("DiaChi"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return model;
	}
	
	
	public int TaoTaiKhoan(NguoiDungModel model) {
		String sql = "{call SP_ThemNguoiDung(?,?,?,?,?)}";
		
		ResultSet rs = null;
		
		int ketqua = 4;
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, model.getDienThoai());
			cs.setString(2, model.getMatKhau());
			cs.setString(3, model.getTen());
			cs.setString(4, model.getEmail());
			cs.setString(5, model.getDiaChi());
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				ketqua = rs.getInt("KetQua");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketqua;
	}
	
	
	public int CapNhatThongTinNguoiDung(NguoiDungModel model) {
		String sql = "{call SP_CapNhatThongTinNguoiDung(?,?,?,?,?)}";
		
		ResultSet rs = null;
		
		int ketqua = 4;
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, model.getId());
			cs.setString(2, model.getDienThoai());
			cs.setString(3, model.getTen());
			cs.setString(4, model.getEmail());
			cs.setString(5, model.getDiaChi());
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				ketqua = rs.getInt("KetQua");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketqua;
	}
	
	
	
	
}
