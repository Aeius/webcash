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

@WebServlet(value = {"/api/login.json"})
public class LoginController extends HttpServlet {
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
		String pw=req.getParameter("pw");
		resp.setHeader("Access-Control-Allow-Origin","*");
		
		try(PrintWriter out=resp.getWriter();){
			if(dao.loginOne(id,pw)) {
				resp.setStatus(resp.SC_OK);
				System.out.println("로그인 성공");
				out.print("{\""+"data"+"\": 1");
				out.print("}");
			}else {
				resp.setStatus(resp.SC_BAD_REQUEST);
				System.out.println("로그인 실패");
				out.print("{\""+"data"+"\": 2");
				out.print("}");
			}
	    	}catch (SQLException e) {
				e.printStackTrace();
			}
//		try {
//			if(dao.loginOne(id,pw)) {
//				System.out.println("로그인 성공!");
//				resp.setStatus(resp.SC_OK);
//			}
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}
		
	}
}
