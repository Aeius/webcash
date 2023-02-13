package controller.restaurant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RestaurantDao;

public class EditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/restaurant/edit.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int r_id = req.getParameter("r_id")!=null?Integer.parseInt(req.getParameter("r_id")):0;
		String m_id = req.getParameter("m_id")!=null?req.getParameter("m_id"):"";
		String name = req.getParameter("name")!=null?req.getParameter("name"):"";
		String addr = req.getParameter("addr")!=null?req.getParameter("addr"):"";
		String content = req.getParameter("content")!=null?req.getParameter("content"):"";
		String img1 = req.getParameter("img1")!=null?req.getParameter("img1"):"";
		String img2 = req.getParameter("img2")!=null?req.getParameter("img2"):"";
		String img3 = req.getParameter("img3")!=null?req.getParameter("img3"):"";
		String img4 = req.getParameter("img4")!=null?req.getParameter("img4"):"";
		String img5 = req.getParameter("img5")!=null?req.getParameter("img5"):"";
		double loc_x = req.getParameter("loc_x")!=null&&!req.getParameter("loc_x").equals("")?Double.parseDouble(req.getParameter("loc_x")):0;
		double loc_y = req.getParameter("loc_y")!=null&&!req.getParameter("loc_y").equals("")?Double.parseDouble(req.getParameter("loc_y")):0;
		
		RestaurantDao dao = new RestaurantDao();
		
		dao.updateData(r_id, m_id, name, addr, content, img1, img2, img3, img4, img5, loc_x, loc_y);
		
		dao.closeConnection();
		
		resp.sendRedirect("./detail.do?r_id="+r_id);
	}
}
