package com.nullp.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nullp.model.RevDao;


public class DelController extends HttpServlet{
	Logger log = Logger.getLogger("com.bit.controller.DelController");
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(req.getParameter("idx"));
		int rnum = Integer.parseInt(req.getParameter("idx"));
		RevDao dao = new RevDao();
		try {
			if(dao.deleteOne(rnum)==0) {
				resp.setStatus(resp.SC_BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
