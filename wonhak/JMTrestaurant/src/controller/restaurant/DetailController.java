package controller.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Restaurant;
import model.RestaurantDao;

public class DetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/restaurant/detail.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int r_id = req.getParameter("r_id")!=null?Integer.parseInt(req.getParameter("r_id")):0;
		
		RestaurantDao dao = new RestaurantDao();
		
		Restaurant restaurant = dao.getData(r_id);
		
		dao.closeConnection();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.setStatus(200);
		
		String jsonStr="";
		jsonStr+="{";
		jsonStr+="\"data\":{";
		jsonStr+="\"r_id\":\""+restaurant.getR_id()+"\",\"m_id\":\""+restaurant.getM_id()+"\",\"name\":\""
				+restaurant.getName()+"\",\"addr\":\""+restaurant.getAddr()+"\",\"content\":\""
				+restaurant.getContent()+"\",\"reg_date\":\""+restaurant.getReg_date()+"\"}";
		jsonStr+="}";
		
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.close();
	}
}
