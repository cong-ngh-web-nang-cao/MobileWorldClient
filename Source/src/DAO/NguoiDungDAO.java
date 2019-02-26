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
	
}
