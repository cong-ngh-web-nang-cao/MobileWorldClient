package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.NguoiDungDAO;
import Models.NguoiDungModel;

/**
 * Servlet implementation class CapNhatThongTinCaNhan
 */
@WebServlet("/CapNhatThongTinCaNhan")
public class CapNhatThongTinCaNhan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapNhatThongTinCaNhan() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		NguoiDungModel nguoidung = (NguoiDungModel) session.getAttribute("NguoiDung");

		int IdNguoiDung = nguoidung.getId();

		NguoiDungDAO dao = new NguoiDungDAO();

		NguoiDungModel model = new NguoiDungModel();

		model.setId(IdNguoiDung);
		model.setDienThoai(request.getParameter("sdt"));
		model.setTen(request.getParameter("ten"));
		model.setEmail(request.getParameter("email"));
		model.setDiaChi(request.getParameter("diachi"));

		int ketqua = dao.CapNhatThongTinNguoiDung(model);
		if (ketqua == 0) {
			session.setAttribute("NguoiDung", model);
		}

		PrintWriter printWriter = response.getWriter();

		printWriter.print(ketqua);
	}

}
