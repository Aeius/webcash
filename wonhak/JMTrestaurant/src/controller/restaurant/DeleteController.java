package controller.restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Restaurant;
import model.RestaurantDao;

public class DeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int r_id = req.getParameter("r_id")!=null?Integer.parseInt(req.getParameter("r_id")):0;
		
		RestaurantDao dao = new RestaurantDao();
		
		dao.deleteData(r_id);
		
		dao.closeConnection();
		
		resp.sendRedirect("./list.do");
	}
}
