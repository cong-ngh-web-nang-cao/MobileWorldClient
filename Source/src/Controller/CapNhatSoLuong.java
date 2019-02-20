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

import Models.GioHangModel;

/**
 * Servlet implementation class CapNhatSoLuong
 */
@WebServlet("/CapNhatSoLuong")
public class CapNhatSoLuong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CapNhatSoLuong() {
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
		HttpSession ses = request.getSession();
		
		int Id =Integer.parseInt((String)request.getParameter("Id"));
		int SoLuongMoi =Integer.parseInt((String)request.getParameter("SoLuongMoi"));
		
		if(ses.getAttribute("Cart") != null) {
			ArrayList<GioHangModel> Cart = (ArrayList<GioHangModel>) ses.getAttribute("Cart");
			
			for(int i= 0; i< Cart.size(); i++) {
				GioHangModel item = Cart.get(i);
				if(item.getSanPham().getId() == Id) { //Nếu tìm thấy sản phẩm cần xóa trong giỏ
					item.setSoLuong(SoLuongMoi);
					item.setTongTien();
				}
			}
			
			ses.setAttribute("Cart", Cart);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("GioHang.jsp");
		dis.forward(request, response);
	}

}
