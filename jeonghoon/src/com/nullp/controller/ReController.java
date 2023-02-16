package com.nullp.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;
import com.nullp.model.RevDto;

public class ReController extends HttpServlet{
	Logger log = Logger.getGlobal();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//view resolver
		int rnum=Integer.parseInt(req.getParameter("idx"));
		RevDao dao = new RevDao();
		try {
			RevDto bean = dao.getOne(rnum);
			req.setAttribute("dto", bean);
		}catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = null;
		rd=req.getRequestDispatcher("re.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String sub = req.getParameter("sub");
		String content = req.getParameter("content");
		sub="└"+sub;
		String uname = req.getParameter("uname");
		int bernum = Integer.parseInt(req.getParameter("bernum"));
		int ref = Integer.parseInt(req.getParameter("ref"));
		int seq = Integer.parseInt(req.getParameter("seq"));
		int lvl = Integer.parseInt(req.getParameter("lvl"));
		RevDao dao = new RevDao();
		try {
			dao.reOne(bernum, uname, sub, content, seq, ref, lvl);
		}catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("review.do");
		
	}
}
