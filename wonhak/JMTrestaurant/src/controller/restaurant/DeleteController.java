package controller.restaurant;

import java.io.File;
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
		
		Restaurant restaurant = dao.getData(r_id);
		
		String uploadPath = req.getServletContext().getRealPath("upload");
		
		if(restaurant.getImg1()!=null && !restaurant.getImg1().equals("")) {
			File prev_img1_f = new File(uploadPath+"/"+restaurant.getImg1());
			if(prev_img1_f.exists()) {
				 prev_img1_f.delete();
			}
		}
		if(restaurant.getImg2()!=null && !restaurant.getImg2().equals("")) {
			File prev_img2_f = new File(uploadPath+"/"+restaurant.getImg2());
			if(prev_img2_f.exists()) {
				 prev_img2_f.delete();
			}
		}
		if(restaurant.getImg3()!=null && !restaurant.getImg3().equals("")) {
			File prev_img3_f = new File(uploadPath+"/"+restaurant.getImg3());
			if(prev_img3_f.exists()) {
				 prev_img3_f.delete();
			}
		}
		if(restaurant.getImg4()!=null && !restaurant.getImg4().equals("")) {
			File prev_img4_f = new File(uploadPath+"/"+restaurant.getImg4());
			if(prev_img4_f.exists()) {
				 prev_img4_f.delete();
			}
		}
		if(restaurant.getImg5()!=null && !restaurant.getImg5().equals("")) {
			File prev_img5_f = new File(uploadPath+"/"+restaurant.getImg5());
			if(prev_img5_f.exists()) {
				 prev_img5_f.delete();
			}
		}
		
		dao.deleteData(r_id);
		
		dao.closeConnection();
		
		resp.sendRedirect("./list.do");
	}
}
