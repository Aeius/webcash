package taeyoung.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import taeyoung.model.BasketDao;
@WebServlet(value = {"/api/delete.json","/api/finddelete.json","/api/helpdelete.json"})

public class DeleteController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ServletContext context=req.getServletContext();
		String url=context.getInitParameter("url");
		String user=context.getInitParameter("user");
		String password=context.getInitParameter("password");
		BasketDao dao=new BasketDao(url,user,password);
		
		int num=Integer.parseInt(req.getParameter("num"));
		resp.setHeader("Access-Control-Allow-Origin","*");
		String db="";
		if(req.getRequestURI().contains("/delete")) {	
	    	db="tybasket01";
	    }else if(req.getRequestURI().contains("/finddelete")) {
	    	db="tybasketfind01";
	    }else if(req.getRequestURI().contains("/helpdelete")) {
	    	db="tyhelp01";
	    }
		try {
			dao.deleteOne(db,num);
		} catch (SQLException e) {
			//error
		}
	}
}
