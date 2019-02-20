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
 * Servlet implementation class XoaGioHang
 */
@WebServlet("/XoaGioHang")
public class XoaGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaGioHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		
		int Id =Integer.parseInt((String)request.getParameter("id"));
		
		if(ses.getAttribute("Cart") != null) {
			ArrayList<GioHangModel> Cart = (ArrayList<GioHangModel>) ses.getAttribute("Cart");
			
			for(int i= 0; i< Cart.size(); i++) {
				GioHangModel item = Cart.get(i);
				if(item.getSanPham().getId() == Id) { //Nếu tìm thấy sản phẩm cần xóa trong giỏ
					Cart.remove(i);
				}
			}
			
			ses.setAttribute("Cart", Cart);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("GioHang.jsp");
		dis.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
