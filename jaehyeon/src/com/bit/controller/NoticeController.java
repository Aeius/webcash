package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.NoticeDAO;
import com.bit.model.NoticeDTO;

public class NoticeController extends HttpServlet {
	NoticeDAO dao = new NoticeDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		RequestDispatcher rd = null;
		// 글 리스트
		if(path.equals("/notice/list.do")) {
			try {
				List<NoticeDTO> list = dao.selectAll();
				req.setAttribute("notice", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/notice/list.jsp");
		// 글 상세 보기
		} else if(path.equals("/notice/detail.do")) {
			try {
				NoticeDTO bean = dao.selectOne(Integer.parseInt(req.getParameter("num")));
				req.setAttribute("detail", bean);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/notice/detail.jsp");
		// 글 작성 페이지 이동
		} else if(path.equals("/notice/write.do")) {
			rd = req.getRequestDispatcher("/notice/write.jsp");
		// 글 수정 페이지 이동
		} else if(path.equals("/notice/modify.do")) {
			try {
				NoticeDTO bean = dao.selectOne(Integer.parseInt(req.getParameter("num")));
				req.setAttribute("detail", bean);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
			rd = req.getRequestDispatcher("/notice/modify.jsp");
		// 삭제 페이지 이동
		} else if(path.equals("/notice/delete.do")){
			rd = req.getRequestDispatcher("/notice/delete.jsp");
			req.getParameter("num");
		}
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		// 글 작성
		if(path.equals("/notice/write.do")) {
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
		} else if (path.equals("/notice/modify.do")) {
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
		} else if (path.equals("/notice/delete.do")) {
			int num = Integer.parseInt(req.getParameter("num"));
			try {
				dao.delete(num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("list.do");
		} 
	}
}
