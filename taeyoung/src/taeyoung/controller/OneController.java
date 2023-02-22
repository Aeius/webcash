package taeyoung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import taeyoung.model.BasketDao;
import taeyoung.model.BasketDto;

@WebServlet(value = {"/api/list1.json","/api/find1.json","/api/help1.json"})
public class OneController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ServletContext context=req.getServletContext();
		String url=context.getInitParameter("url");
		String user= context.getInitParameter("user");
		String password= context.getInitParameter("password");
		BasketDao dao=new BasketDao(url, user, password);
		int num=Integer.parseInt(req.getParameter("num"));
		
		resp.setHeader("Access-Control-Allow-Origin","*");
		String db="";
		if(req.getRequestURI().contains("/list1")) {	
	    	db="tybasket01";
	    }else if(req.getRequestURI().contains("/find1")) {
	    	db="tybasketfind01";
	    }else if(req.getRequestURI().contains("/help1")) {
	    	db="tyhelp01";
	    }
		try(PrintWriter out=resp.getWriter();){
			
			try {
				out.print("{\""+db+"\":[");
				BasketDto bean = dao.selectOne(db,num);
				out.print(bean);
				out.print("]}");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
}
