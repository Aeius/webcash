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
@WebServlet(value = {"/api/edit.json","/api/findedit.json","/api/helpedit.json"})

public class EditController extends HttpServlet {
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
		String sub=req.getParameter("sub");
		String content=req.getParameter("content");
		System.out.println(num+sub+content);
		resp.setHeader("Access-Control-Allow-Origin","*");
		String db="";
		if(req.getRequestURI().contains("/edit")) {	
	    	db="tybasket01";
	    }else if(req.getRequestURI().contains("/findedit")) {
	    	db="tybasketfind01";
	    }else if(req.getRequestURI().contains("/helpedit")) {
	    	db="tyhelp01";
	    }
		try {
			dao.editOne(db,num,sub,content);
		} catch (SQLException e) {
			//error
		}
	}
}
