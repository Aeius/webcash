package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.UserDAO;
import com.bit.model.UserDTO;

@WebServlet(value={"/user/login.do", "/user/join.do", "/user/logout.do"})
public class UserController extends HttpServlet {
	Logger log = Logger.getGlobal();
	UserDAO dao = new UserDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		// 로그인 페이지 이동
		if(path.equals("/user/login.do")) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		// 회원가입 페이지 이동
		} else if(path.equals("/user/join.do")) {
			req.getRequestDispatcher("join.jsp").forward(req, resp);
		// 로그아웃
		} else if(path.equals("/user/logout.do")) {
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("login.do");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		String context = req.getContextPath();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		// 로그인
		if(path.equals("/user/login.do")) {
			UserDTO bean = new UserDTO();
			bean.setNum(Integer.parseInt(req.getParameter("num")));
			bean.setPw(req.getParameter("pw"));
			bean.setJob(req.getParameter("job"));
			log.info(bean.toString());
			try {
				UserDTO result = dao.login(bean);
				// 로그인 성공
				HttpSession session = req.getSession();
				if(result.getName()!=null) {
					// 로그인 정보 세션에 저장하기
					session.setAttribute("num", result.getNum());
					session.setAttribute("name", result.getName());
					session.setAttribute("job", result.getJob());
					session.setAttribute("loginResult", "true");
					resp.sendRedirect("login.do");
				// 로그인 실패
				} else {
					session.setAttribute("loginResult", "false");
					resp.sendRedirect("login.do");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		// 회원가입
		} else if(path.equals("/user/join.do")) {
			UserDTO bean = new UserDTO();
			bean.setNum(Integer.parseInt(req.getParameter("num")));
			bean.setName(req.getParameter("name"));
			bean.setPw(req.getParameter("pw"));
			bean.setJob(req.getParameter("job"));
			log.info(bean.toString());
			try {
				dao.insertUser(bean);
				resp.sendRedirect("login.do");
			// 중복일 경우
			} catch (SQLIntegrityConstraintViolationException e) {
				HttpSession session = req.getSession();
				session.setAttribute("joinResult", "false");
				resp.sendRedirect("join.do");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
