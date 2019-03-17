package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.ConnectDB;
import Models.SanPhamViewModel;

public class TimKiemDAO {
	Connection con = ConnectDB.getConnect();
	
	public List<SanPhamViewModel> KetQuaTimKiem(String TuKhoa, int Start, int End){
		List<SanPhamViewModel> list = new ArrayList<SanPhamViewModel>();
		
		String sql = "{call SP_TimKiemSanPham(?,?,?)}";
		
		ResultSet rs = null;
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setString(1, TuKhoa);
			cs.setInt(2, Start);
			cs.setInt(3, End);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SanPhamViewModel model = new SanPhamViewModel();
				
				model.setId(rs.getInt("Id"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				
				list.add(model);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int SoKetQuaTimThay(String TuKhoa)
	{
		String sql = "{call SoKetQuaTimThay(?)}";
		
		ResultSet rs = null;
		
		int SoLuong = 0;
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			
			cs.setString(1, TuKhoa);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SoLuong = rs.getInt("SoLuong");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SoLuong;
	}
	
	
	public List<SanPhamViewModel> KetQuaLoc(String str){
		SanPhamDAO spdao = new SanPhamDAO();
		ResultSet rs = null;
		List<SanPhamViewModel> list = new ArrayList<SanPhamViewModel>();
		
		String sql = "{call SP_LocKetQua (?)}";
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, str);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SanPhamViewModel model = new SanPhamViewModel();
				String anhsp = spdao.Lay1AnhSanPham(rs.getInt("Id"));
				model.setAnh(anhsp);
				
				model.setId(rs.getInt("Id"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				
				list.add(model);		
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
