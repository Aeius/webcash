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


@WebServlet(value = {"/api/list.json","/api/findlist.json","/api/helplist.json"})
public class ListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		ServletContext context=req.getServletContext();
		String url=context.getInitParameter("url");
		String user=context.getInitParameter("user");
		String password=context.getInitParameter("password");
		BasketDao dao=new BasketDao(url,user,password);
		resp.setHeader("Access-Control-Allow-Origin","*");
	    resp.setContentType("application/json");
	    String db="";
	    //if(this.getServletName().equals("list")) {
	    if(req.getRequestURI().contains("/list")) {	
	    	db="tybasket01";
	    //}else if(this.getServletName().equals("findlist")) {
	    }else if(req.getRequestURI().contains("/findlist")) {
	    	db="tybasketfind01";
	    //}else if(this.getServletName().equals("helplist")) {
	    }else if(req.getRequestURI().contains("/helplist")) {
	    	db="tyhelp01";
	    }
	    
	    try(PrintWriter out=resp.getWriter();){
	    	out.print("{\""+db+"\":");
	         try {
	            out.print((dao.getList(db).toString()).replaceAll("\n", "<br>"));
	            
	         } catch (SQLException e) {
	            out.print("[]");
	         }
	         out.print("}");
	      }
	    
	}
}
