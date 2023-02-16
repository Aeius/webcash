package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.StudentDAO;
import com.bit.model.AchieveDTO;

public class StudentController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO dao = new StudentDAO();
		if(req.getParameter("num").equals("null")) {
			req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
		} else {
			int userNum = Integer.parseInt(req.getParameter("num"));
		
			try {
				List<AchieveDTO> list = dao.selectInfo(userNum);
				req.setAttribute("student", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = req.getRequestDispatcher("/student/list.jsp");
			rd.forward(req, resp);
		}
	}
}
