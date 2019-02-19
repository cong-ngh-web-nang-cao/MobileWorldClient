package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.ConnectDB;
import Models.SanPhamViewModel;

public class SanPhamDAO {
	Connection con = ConnectDB.getConnect();
	
	public List<SanPhamViewModel> SanPhamMoi() {		
		ResultSet rs = null;
		String sql = "{call SP_SanPhamMoi}";
		
		ArrayList<SanPhamViewModel> list = new ArrayList<SanPhamViewModel>();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SanPhamViewModel model = new SanPhamViewModel();
				
				model.setId(rs.getInt("Id"));
				model.setDanhMuc(rs.getString("DanhMuc"));
				model.setNhaSanXuat(rs.getString("NhaSanXuat"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				model.setCamTruoc(rs.getInt("CameraTruoc"));
				model.setCamSau(rs.getInt("CameraSau"));
				model.setROM(rs.getInt("ROM"));
				model.setRAM(rs.getInt("RAM"));
				model.setTheNho(rs.getInt("TheNho"));
				
				list.add(model);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<SanPhamViewModel> SanPhamHot() {		
		ResultSet rs = null;
		String sql = "{call SP_SanPhamHot}";
		
		ArrayList<SanPhamViewModel> list = new ArrayList<SanPhamViewModel>();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SanPhamViewModel model = new SanPhamViewModel();
				
				model.setId(rs.getInt("Id"));
				model.setDanhMuc(rs.getString("DanhMuc"));
				model.setNhaSanXuat(rs.getString("NhaSanXuat"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				model.setCamTruoc(rs.getInt("CameraTruoc"));
				model.setCamSau(rs.getInt("CameraSau"));
				model.setROM(rs.getInt("ROM"));
				model.setRAM(rs.getInt("RAM"));
				model.setTheNho(rs.getInt("TheNho"));
				
				list.add(model);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<SanPhamViewModel> SanPhamTheoHang(int IdNhaSX) {		
		ResultSet rs = null;
		String sql = "{call SP_SanPhamTheoHangSX(?)}";
		
		ArrayList<SanPhamViewModel> list = new ArrayList<SanPhamViewModel>();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, IdNhaSX);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				SanPhamViewModel model = new SanPhamViewModel();
				
				model.setId(rs.getInt("Id"));
				model.setDanhMuc(rs.getString("DanhMuc"));
				model.setNhaSanXuat(rs.getString("NhaSanXuat"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				model.setCamTruoc(rs.getInt("CameraTruoc"));
				model.setCamSau(rs.getInt("CameraSau"));
				model.setROM(rs.getInt("ROM"));
				model.setRAM(rs.getInt("RAM"));
				model.setTheNho(rs.getInt("TheNho"));
				
				list.add(model);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public SanPhamViewModel ChiTietSanPham(String Id)
	{
		ResultSet rs = null;
		String sql = "{call SP_ChiTietSanPham(?)}";
		
		SanPhamViewModel model = new SanPhamViewModel();
		
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, Id);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				model.setId(rs.getInt("Id"));
				model.setDanhMuc(rs.getString("DanhMuc"));
				model.setNhaSanXuat(rs.getString("NhaSanXuat"));
				model.setTenSP(rs.getString("TenSP"));
				model.setGia(rs.getInt("Gia"));
				model.setCamTruoc(rs.getInt("CameraTruoc"));
				model.setCamSau(rs.getInt("CameraSau"));
				model.setROM(rs.getInt("ROM"));
				model.setRAM(rs.getInt("RAM"));
				model.setTheNho(rs.getInt("TheNho"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return model;
	}
	
	public String Lay1AnhSanPham(int Id) {
		String sql = "{call SP_Lay1AnhSanPham(?)}";
		
		String anhsp = "";
		
		CallableStatement cs;
		try {
			cs = con.prepareCall(sql);
			cs.setInt(1, Id);
			
			ResultSet rs = cs.executeQuery();
			
			while(rs.next()) {
				anhsp = rs.getString("Anh");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return anhsp;	
	}
	
	
	public List<String> LayAnhSanPham(String Id) {
		String sql = "{call SP_LayAnhSanPham(?)}";
		
		ArrayList<String> list = new ArrayList<String>();
		
		CallableStatement cs;
		try {
			cs = con.prepareCall(sql);
			cs.setString(1, Id);
			
			ResultSet rs = cs.executeQuery();
			
			while(rs.next()) {
				String anhsp;
				anhsp = rs.getString("Anh");
				
				list.add(anhsp);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}
	
	
	
	
	
	
	
	
}
