package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.TimKiemDAO;
import Models.SanPhamViewModel;

/**
 * Servlet implementation class LocSanPham
 */
@WebServlet("/LocSanPham")
public class LocSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocSanPham() {
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
		String str = request.getParameter("sql");
		String sql = "";
		if(str != null && str != "") {
			sql = "SELECT *FROM dbo.SanPham WHERE " + str;
		}else {
			sql = "SELECT *FROM dbo.SanPham";
		}
		
		TimKiemDAO dao = new TimKiemDAO();
		List<SanPhamViewModel> list = dao.KetQuaLoc(sql);
		
		PrintWriter printWriter = response.getWriter();
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		printWriter.print(result);
		printWriter.flush();
		printWriter.close();
	}

}
