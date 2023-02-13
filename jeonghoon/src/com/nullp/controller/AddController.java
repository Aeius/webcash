package com.nullp.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;

public class AddController extends HttpServlet{
	Logger log = Logger.getGlobal();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//view resolver
		RequestDispatcher rd = null;
		rd=req.getRequestDispatcher("add.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sub = req.getParameter("sub");
		String content = req.getParameter("content");
		String uname = req.getParameter("uname");
		RevDao dao = new RevDao();
		try {
			dao.pushList(1, 1, 1, uname, sub, content);
		}catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("review.do");
		
	}
}
