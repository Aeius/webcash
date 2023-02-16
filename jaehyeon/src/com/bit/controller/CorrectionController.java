package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.CorrectionDAO;
import com.bit.model.CorrectionDTO;

public class CorrectionController extends HttpServlet {
	Logger log = Logger.getGlobal();
	CorrectionDAO dao = new CorrectionDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		RequestDispatcher rd = null;
		// 글 리스트
		if(path.equals("/correction/list.do")) {
			try {
				List<CorrectionDTO> list = dao.selectAll();
				req.setAttribute("correction", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/correction/list.jsp");
		// 글 상세 보기
		} else if(path.equals("/correction/detail.do")) {
			try {
				CorrectionDTO bean = dao.selectOne(Integer.parseInt(req.getParameter("num")));
				log.info(bean.toString());
				req.setAttribute("detail", bean);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/correction/detail.jsp");
		// 글 작성 페이지 이동
		} else if(path.equals("/correction/write.do")) {
			rd = req.getRequestDispatcher("/correction/write.jsp");
		// 글 수정 페이지 이동
		} else if(path.equals("/correction/modify.do")) {
			try {
				CorrectionDTO bean = dao.selectOne(Integer.parseInt(req.getParameter("num")));
				req.setAttribute("detail", bean);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/correction/modify.jsp");
		// 삭제 페이지 이동
		} else if(path.equals("/correction/delete.do")){
			rd = req.getRequestDispatcher("/correction/delete.jsp");
		// 답글 페이지 이동
		} else if(path.equals("/correction/reply.do")) {
			try {
				CorrectionDTO bean = dao.selectOne(Integer.parseInt(req.getParameter("num")));
				req.setAttribute("detail", bean);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/correction/reply.jsp");
		}
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		// 글 작성
		if(path.equals("/correction/write.do")) {
			int user_num = Integer.parseInt(req.getParameter("userNum"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			try {
				dao.insert(user_num, title, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("list.do");
		// 글 수정
		} else if (path.equals("/correction/modify.do")) {
			int num = Integer.parseInt(req.getParameter("num"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			try {
				dao.update(num, title, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("detail.do?num="+num);
		// 글 삭제
		} else if (path.equals("/correction/delete.do")) {
			int num = Integer.parseInt(req.getParameter("num"));
			try {
				dao.delete(num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("list.do");
		// 답글 달기
		} else if (path.equals("/correction/reply.do")) {
			int userNum = Integer.parseInt(req.getParameter("userNum"));
			int ref = Integer.parseInt(req.getParameter("ref"));
			int seq = Integer.parseInt(req.getParameter("seq"));
			int lvl = Integer.parseInt(req.getParameter("lvl"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			try {
				dao.reply(userNum, title, content, ref, seq, lvl);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("list.do");
		}
	}
}
