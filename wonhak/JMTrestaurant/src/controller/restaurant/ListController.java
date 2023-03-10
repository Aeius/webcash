package controller.restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Restaurant;
import model.RestaurantDao;

public class ListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/restaurant/index.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int currentPageNum = req.getParameter("currentPageNum")!=null?(Integer.parseInt(req.getParameter("currentPageNum"))-1):0;
		int countDataInPage = req.getParameter("countDataInPage")!=null?Integer.parseInt(req.getParameter("countDataInPage")):0;
		int countInPageGroup = req.getParameter("countInPageGroup")!=null?Integer.parseInt(req.getParameter("countInPageGroup")):0;
		String searchColumn = req.getParameter("searchColumn")!=null?req.getParameter("searchColumn"):"";
		String searchValue = req.getParameter("searchValue")!=null?req.getParameter("searchValue"):"";

		searchValue = new String(searchValue.getBytes("iso-8859-1"), "utf-8");
		
		System.out.println(searchValue);
		
		RestaurantDao dao = new RestaurantDao();
		ArrayList<Restaurant> list = dao.getList(currentPageNum, countDataInPage, countInPageGroup, searchColumn, searchValue);
		int totalDataCount = dao.getListTotalCount(searchColumn, searchValue);
		
		dao.closeConnection();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.setStatus(200);
		
		String jsonStr="";
		jsonStr+="{";
		jsonStr+="\"data\":";
		jsonStr+=list.toString();
		jsonStr+=",";
		jsonStr+="\"totalDataCount\":"+totalDataCount;
		jsonStr+="}";
		
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.close();
	}
}
