package controller.restaurant;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.RestaurantDao;

public class AddController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/restaurant/add.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		req.setCharacterEncoding("utf-8");
		
		String uploadPath = req.getServletContext().getRealPath("upload");
		
		File dir = new File(uploadPath);
		if(!dir.exists()) dir.mkdir();
		
		int maxSize = 1024 * 1024 * 5; // 키로바이트 * 메가바이트 * 기가바이트 
		MultipartRequest multiReq = new MultipartRequest(req,
				  uploadPath,
				  maxSize,
				  "utf-8",
				  new DefaultFileRenamePolicy());
		
		String m_id = multiReq.getParameter("m_id")!=null?multiReq.getParameter("m_id"):"";
		String name = multiReq.getParameter("name")!=null?multiReq.getParameter("name"):"";
		String addr = multiReq.getParameter("addr")!=null?multiReq.getParameter("addr"):"";
		String content = multiReq.getParameter("content")!=null?multiReq.getParameter("content"):"";
		File img1_f = multiReq.getFile("img1")!=null?multiReq.getFile("img1"):null;
		File img2_f = multiReq.getFile("img2")!=null?multiReq.getFile("img2"):null;
		File img3_f = multiReq.getFile("img3")!=null?multiReq.getFile("img3"):null;
		File img4_f = multiReq.getFile("img4")!=null?multiReq.getFile("img4"):null;
		File img5_f = multiReq.getFile("img5")!=null?multiReq.getFile("img5"):null;
		double loc_x = multiReq.getParameter("loc_x")!=null&&!multiReq.getParameter("loc_x").equals("")?Double.parseDouble(multiReq.getParameter("loc_x")):0;
		double loc_y = multiReq.getParameter("loc_y")!=null&&!multiReq.getParameter("loc_y").equals("")?Double.parseDouble(multiReq.getParameter("loc_y")):0;
		
		String img1=img1_f!=null?img1_f.getName():null;
		String img2=img2_f!=null?img2_f.getName():null;
		String img3=img3_f!=null?img3_f.getName():null;
		String img4=img4_f!=null?img4_f.getName():null;
		String img5=img5_f!=null?img5_f.getName():null;
		
		RestaurantDao dao = new RestaurantDao();
		
		dao.insertData(m_id, name, addr, content, img1, img2, img3, img4, img5, loc_x, loc_y);
		
		dao.closeConnection();
		
		resp.sendRedirect("./list.do");
	};
}
