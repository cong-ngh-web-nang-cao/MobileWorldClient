package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DonHangDAO;
import Models.ChiTietDonHangModel;
import Models.DonHangModel;
import Models.GioHangModel;
import Models.NguoiDungModel;

/**
 * Servlet implementation class DatHang
 */
@WebServlet("/DatHang")
public class DatHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Nếu khách hàng đã đăng nhập thì lấy thông tin khách hàng để thêm vào đơn luôn
		//Nếu khách hàng chưa đăng nhập thì lấy thông tin khách hàng điển trên form để thêm vào đơn
		
		int ketquathem = 0;
		
		//Kiểm tra khách hàng đã đăng nhập chưa
		HttpSession ses = request.getSession();
		DonHangDAO dao = new DonHangDAO();
		
		int IdDonHang = 0;
		
		NguoiDungModel nguoidung = (NguoiDungModel) ses.getAttribute("NguoiDung");
		
		//Nếu đã đăng nhập
		if(nguoidung != null) {
			DonHangModel donhang = new DonHangModel();
			donhang.setKhachHang(nguoidung.getId());
			donhang.setTenKH(nguoidung.getTen());
			donhang.setDienThoai(nguoidung.getDienThoai());
			donhang.setEmail(nguoidung.getEmail());
			donhang.setDiaChi(nguoidung.getDiaChi());
			
			IdDonHang = dao.DatHang(donhang);
			
			if(IdDonHang != 0) {
				List<GioHangModel> list = (List<GioHangModel>) ses.getAttribute("Cart");
				
				if(list.size() > 0) {
					for(GioHangModel giohang : list) {
						ChiTietDonHangModel chitiet = new ChiTietDonHangModel();
						chitiet.setDonHang(IdDonHang);
						chitiet.setSanPham(giohang.getSanPham().getId());
						chitiet.setSoLuong(giohang.getSoLuong());
						chitiet.setThanhTien(giohang.getTongTien());
						
						dao.ThemChiTietDonHang(chitiet);
						ketquathem = 1;
					}
				}
			}			
		}
		//Chưa đăng nhập
		else {
			DonHangModel donhang = new DonHangModel();
			donhang.setKhachHang(0);
			donhang.setTenKH(request.getParameter("TenKH"));
			donhang.setDienThoai(request.getParameter("DienThoai"));
			donhang.setEmail(request.getParameter("Email"));
			donhang.setDiaChi(request.getParameter("DiaChi"));
			
			IdDonHang = dao.DatHang(donhang);
			
			if(IdDonHang != 0) {
				List<GioHangModel> list = (List<GioHangModel>) ses.getAttribute("Cart");
				
				if(list.size() > 0) {
					for(GioHangModel giohang : list) {
						ChiTietDonHangModel chitiet = new ChiTietDonHangModel();
						chitiet.setDonHang(IdDonHang);
						chitiet.setSanPham(giohang.getSanPham().getId());
						chitiet.setSoLuong(giohang.getSoLuong());
						chitiet.setThanhTien(giohang.getTongTien());
						
						dao.ThemChiTietDonHang(chitiet);
						ketquathem = 1;
					}
				}
			}		
		}
		
		
		PrintWriter printWriter = response.getWriter();
		printWriter.print(ketquathem);
	
	}

}
