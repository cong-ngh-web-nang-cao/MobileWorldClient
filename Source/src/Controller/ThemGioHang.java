package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.SanPhamDAO;
import Models.GioHangModel;
import Models.SanPhamViewModel;

/**
 * Servlet implementation class ThemGioHang
 */
@WebServlet("/ThemGioHang")
public class ThemGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemGioHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("Index.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SanPhamDAO dao = new SanPhamDAO();
		HttpSession ses = request.getSession();
		
		int Id = Integer.parseInt((String)request.getParameter("Id"));		
		SanPhamViewModel SanPham = dao.ChiTietSanPham(Id); //Lấy sản phẩm từ id
		
		int SoLuong = Integer.parseInt((String)request.getParameter("SoLuong")); //Lấy số lượng sản phẩm cần thêm vào giỏ
		if(SoLuong == 0) {
			SoLuong = 1;
		}
		
		//Nếu đã có sản phẩm trong giỏ hàng, tức là có giỏ hàng
		if(ses.getAttribute("Cart") != null) {
			ArrayList<GioHangModel> Cart = (ArrayList<GioHangModel>) ses.getAttribute("Cart"); //Lấy giỏ hàng ra cho vào 1 list
				
			boolean timthay = false;
			//Nếu đã có sản phẩm này trong giỏ thì tăng số lượng sản phẩm lên 1
			for(GioHangModel sp : Cart) {
				if(sp.getSanPham().getId() == Id) {
					timthay = true; //đã tìm thấy sản phẩm trong giỏ
					int soluongmoi = sp.getSoLuong() + 1;
					sp.setSoLuong(soluongmoi);
					sp.setTongTien();
				}
			}
			
			//Nếu không tìm thấy sản phẩm trong giỏ thì thêm mới thôi
			if(timthay == false) {
				GioHangModel item = new GioHangModel();
				item.setSanPham(SanPham);
				item.setSoLuong(SoLuong);
				item.setTongTien();
				
				Cart.add(item);
			}
			
			ses.setAttribute("Cart", Cart);
		}
		else {// Nếu chưa có giỏ hàng thì tạo và thêm sản phẩm đó vào
			GioHangModel item = new GioHangModel();
			item.setSanPham(SanPham);
			item.setSoLuong(SoLuong);
			item.setTongTien();
			
			ArrayList<GioHangModel> Cart = new ArrayList<GioHangModel>();
			Cart.add(item);
			
			ses.setAttribute("Cart", Cart);
		}	
		
		//Đưa về giỏ hàng .jsp
		RequestDispatcher dis = request.getRequestDispatcher("GioHang.jsp");
		dis.forward(request, response);
	}
	
	
}
