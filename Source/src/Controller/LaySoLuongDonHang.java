package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DonHangDAO;
import Models.NguoiDungModel;

/**
 * Servlet implementation class LaySoLuongDonHang
 */
@WebServlet("/LaySoLuongDonHang")
public class LaySoLuongDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LaySoLuongDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DonHangDAO dao = new DonHangDAO();
		
		int IdNguoiDung = 0;
		HttpSession ses = request.getSession();
		
		NguoiDungModel model = (NguoiDungModel)ses.getAttribute("NguoiDung");
		
		IdNguoiDung = model.getId();
		
		int soluong = dao.LaySoLuongDonHang(IdNguoiDung);
		
		PrintWriter printWriter = response.getWriter();
		printWriter.print(soluong);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
