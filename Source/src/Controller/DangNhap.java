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
 * Servlet implementation class DangNhap
 */
@WebServlet("/DangNhap")
public class DangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhap() {
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
		NguoiDungDAO dao = new NguoiDungDAO();
		
		String kieudangnhap = request.getParameter("kieudangnhap");
		String matkhau = request.getParameter("matkhau");
		
		boolean ketqua = dao.DangNhap(kieudangnhap, matkhau);
		
		NguoiDungModel model = dao.LayThongTinNguoiDung(kieudangnhap);
		Gson gson = new Gson();
		
		String thongtin = null;
		if(ketqua == true) //Nếu đăng nhập thành công thì trả về thông tin người dùng và lưu vào session
		{
			HttpSession ses = request.getSession();
			ses.setAttribute("NguoiDung", model);
			thongtin = gson.toJson(model);
		}
		else //Sai thì báo lỗi
		{ 
			thongtin = null;
		}
		
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		
		//printWriter.println(ketqua);
		printWriter.print(thongtin);
	}

}
