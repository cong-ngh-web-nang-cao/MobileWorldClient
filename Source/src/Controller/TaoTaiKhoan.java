package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.NguoiDungDAO;
import Models.NguoiDungModel;

/**
 * Servlet implementation class TaoTaiKhoan
 */
@WebServlet("/TaoTaiKhoan")
public class TaoTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaoTaiKhoan() {
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
		NguoiDungDAO dao = new NguoiDungDAO();
		
		NguoiDungModel model = new NguoiDungModel();
		model.setDienThoai(request.getParameter("sdt"));
		model.setMatKhau(request.getParameter("matkhau"));
		model.setTen(request.getParameter("ten"));
		model.setEmail(request.getParameter("email"));
		model.setDiaChi(request.getParameter("diachi"));
		
		int ketqua = dao.TaoTaiKhoan(model);
		
		PrintWriter printWriter = response.getWriter();
		
		printWriter.print(ketqua);
		
	}

}
