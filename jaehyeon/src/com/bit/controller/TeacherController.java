package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.AchieveDTO;
import com.bit.model.SubjectDTO;
import com.bit.model.TeacherDAO;

public class TeacherController extends HttpServlet {
	TeacherDAO dao = new TeacherDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		RequestDispatcher rd = null;
		// 과목 조회
		if(path.equals("/teacher/list.do")) {
			try {
				List<SubjectDTO> list = dao.selectSubject();
				req.setAttribute("subject", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("list.jsp");
			rd.forward(req, resp);
		// 성적 조회
		} else if (path.equals("/teacher/achieve.do")) {
				resp.setCharacterEncoding("UTF-8");
				resp.setHeader("Access-Control-Allow-Origin", "*");
				req.setCharacterEncoding("UTF-8");
				String subject = req.getParameter("subject");
				PrintWriter out = resp.getWriter();
				List<AchieveDTO> list;
				try {
					list = dao.selectAchieve(subject);
					out.print("{\"achieve\":");
					out.print(list);
					out.print("}");
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		// 과목 추가
		if(path.equals("/teacher/addSub.do")) {
			
			try {
				dao.insertSubject(req.getParameter("sub"));
			} catch (SQLIntegrityConstraintViolationException e) {
				session.setAttribute("result", "dup");
			} catch (SQLException e) {
				session.setAttribute("result", "err");
			}
			resp.sendRedirect("list.do");
		}
		// 성적 삭제
		if(path.equals("/teacher/delSub.do")) {
			SubjectDTO bean = new SubjectDTO();
			bean.setName(req.getParameter("subName"));
			try {
				dao.deleteSub(bean);
			} catch (SQLException e) {
				session.setAttribute("result", "err");
			}
			resp.sendRedirect("list.do?subName="+req.getParameter("subName"));
		}
		// 성적 추가
		if(path.equals("/teacher/addAchieve.do")) {
			AchieveDTO bean = new AchieveDTO();
			bean.setSubName(req.getParameter("subName"));
			bean.setUserNum(Integer.parseInt(req.getParameter("userNum")));
			bean.setScore(Integer.parseInt(req.getParameter("score")));
			try {
				dao.insertAchieve(bean);
			} catch (SQLIntegrityConstraintViolationException e) {
				session.setAttribute("result", "nothing");
			} catch (SQLException e) {
				session.setAttribute("result", "err");
			}
			resp.sendRedirect("list.do?subName="+req.getParameter("subName"));
		}
		// 성적 수정
		if(path.equals("/teacher/putAchieve.do")) {
			AchieveDTO bean = new AchieveDTO();
			bean.setUserNum(Integer.parseInt(req.getParameter("userNum")));
			bean.setScore(Integer.parseInt(req.getParameter("score")));
			bean.setSubName(req.getParameter("subName"));
			try {
				dao.updateAchieve(bean);
			} catch (SQLException e) {
				session.setAttribute("result", "err");
			}
			resp.sendRedirect("list.do?subName="+req.getParameter("subName"));
		}
		// 성적 삭제
		if(path.equals("/teacher/delAchieve.do")) {
			AchieveDTO bean = new AchieveDTO();
			bean.setUserNum(Integer.parseInt(req.getParameter("userNum")));
			bean.setSubName(req.getParameter("subName"));
			try {
				dao.deleteAchieve(bean);
			} catch (SQLException e) {
				session.setAttribute("result", "err");
			}
			resp.sendRedirect("list.do?subName="+req.getParameter("subName"));
		}
	}
}
