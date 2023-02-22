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
@WebServlet(value = {"/api/add.json","/api/findadd.json","/api/helpadd.json"})
public class AddController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ServletContext context=req.getServletContext();
		String url=context.getInitParameter("url");
		String user=context.getInitParameter("user");
		String password=context.getInitParameter("password");
		
		BasketDao dao=new BasketDao(url,user,password);
		String id=req.getParameter("id");
		String sub=req.getParameter("sub");
		String content=req.getParameter("content");
		resp.setHeader("Access-Control-Allow-Origin","*");
		resp.setStatus(resp.SC_CREATED);
		String db="";
		if(req.getRequestURI().contains("/add")) {	
	    	db="tybasket01";
	    }else if(req.getRequestURI().contains("/findadd")) {
	    	db="tybasketfind01";
	    }else if(req.getRequestURI().contains("/helpadd")) {
	    	db="tyhelp01";
	    }
		try {
			
			dao.insertOne(db,id,sub,content);
		} catch (SQLException e) {
			//resp.sendError(sc);
			e.printStackTrace();
		}
	}
}
