package com.nullp.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;
import com.nullp.model.RevDto;

public class DetailController extends HttpServlet{
	Logger log = Logger.getLogger("com.bit.controller.DetailController");
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(req.getParameter("idx"));
		System.out.println(req.getParameter("idx"));
		int rnum=Integer.parseInt(req.getParameter("idx"));
		RevDao dao = new RevDao();
		try {
			RevDto bean = dao.getOne(rnum);
			req.setAttribute("dto", bean);
		}catch (Exception e) {
			e.printStackTrace();
		}
		String viewName="detail.jsp";
		if(req.getRequestURI().contains("edit"))
			viewName="edit.jsp";	
		RequestDispatcher rd = null;
		rd=req.getRequestDispatcher(viewName);
		rd.forward(req, resp);
	}
}
