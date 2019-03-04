package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.TimKiemDAO;
import Models.SanPhamViewModel;

/**
 * Servlet implementation class TimKiemSanPham
 */
@WebServlet("/TimKiemSanPham")
public class TimKiemSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimKiemSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String TuKhoa = request.getParameter("TuKhoa");
		
		HttpSession ses = request.getSession();
		ses.setAttribute("TuKhoa", TuKhoa);

		RequestDispatcher dis = request.getRequestDispatcher("/TimKiem.jsp?pageIndex=1");
		dis.forward(request, response);
	}

}
