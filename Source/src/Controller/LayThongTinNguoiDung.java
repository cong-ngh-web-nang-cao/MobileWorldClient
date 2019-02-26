package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.NguoiDungDAO;
import Models.NguoiDungModel;

/**
 * Servlet implementation class LayThongTinNguoiDung
 */
@WebServlet("/LayThongTinNguoiDung")
public class LayThongTinNguoiDung extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayThongTinNguoiDung() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		NguoiDungModel nguoidung = (NguoiDungModel) session.getAttribute("NguoiDung");
		
		Gson gson = new Gson();
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter printWriter = response.getWriter();
		
		String thongtin = gson.toJson(nguoidung);
		
		printWriter.print(thongtin);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
