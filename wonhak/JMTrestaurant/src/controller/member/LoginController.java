package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Member;
import model.MemberDao;
import model.Restaurant;
import model.RestaurantDao;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/login.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String m_id = req.getParameter("m_id")!=null?req.getParameter("m_id"):"";
		String password = req.getParameter("password")!=null?req.getParameter("password"):"";
		
		MemberDao dao = new MemberDao();
		System.out.println(m_id+" - "+password);
		Member member = dao.getData(m_id,password);
		System.out.println(member);
		
		HttpSession session = req.getSession();
		if(member!=null) {
			session.setAttribute("m_id", member.getM_id());
			session.setAttribute("level", member.getLevel());
		}
		
		dao.closeConnection();
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.setStatus(200);
		
		String jsonStr="";
		jsonStr+="{";
		jsonStr+="\"data\":";
		jsonStr+=member!=null?member.toString():"\"empty\"";
		jsonStr+="}";
		
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.close();
	}
}
