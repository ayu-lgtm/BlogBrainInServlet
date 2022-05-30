package com.project.Servlets;

import com.project.entities.message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession s = req.getSession();

		s.removeAttribute("currentuser");

		message m = new message("Logout Successfully !", "success", "alert-success");

		s.setAttribute("msg", m);

		res.sendRedirect("login.jsp");

	}

}
