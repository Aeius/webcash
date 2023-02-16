package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

@WebServlet("/join.do")
public class JoinController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewPath="/pages/join.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(viewPath);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json");
		resp.setStatus(200);
		
		String m_id = req.getParameter("m_id")!=null?req.getParameter("m_id"):"";
		String password = req.getParameter("password")!=null?req.getParameter("password"):"";
		String name = req.getParameter("name")!=null?req.getParameter("name"):"";
		String email = req.getParameter("email")!=null?req.getParameter("email"):"";
		int age = req.getParameter("age")!=null?Integer.parseInt(req.getParameter("age")):0;
		String gender = req.getParameter("gender")!=null?req.getParameter("gender"):"M";
		
		MemberDao dao = new MemberDao();
		
		Member member = dao.getData(m_id);
		if(member!=null) {
			String jsonStr="";
			jsonStr+="{";
			jsonStr+="\"data\":\"fail, exists m_id\"";
			jsonStr+="}";
			
			PrintWriter out = resp.getWriter();
			out.println(jsonStr);
			out.close();
			
			dao.closeConnection();
			return;
		}
		
		dao.insertData(m_id, password, name, email, age, gender);
		
		dao.closeConnection();
		
		String jsonStr="";
		jsonStr+="{";
		jsonStr+="\"data\":\"success\"";
		jsonStr+="}";
		
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.close();
	}
}
