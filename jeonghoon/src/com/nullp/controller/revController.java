package com.nullp.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nullp.model.*;


public class revController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//model
		RevDao dao = new RevDao();
		try {
			List<RevDto> list = dao.getList();
			req.setAttribute("revList", list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		//view resolver
		RequestDispatcher rd = null;
		rd=req.getRequestDispatcher("review.jsp");
		rd.forward(req, resp);
		
	}
}
