package com.project.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.userdao;
import com.project.entities.message;
import com.project.entities.user;
import com.project.helpers.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// login into page

		String useremail = req.getParameter("email");
		String password = req.getParameter("password");

		userdao dao = new userdao(ConnectionProvider.getConnection());

		user u = dao.getUserByEmailAndPassword(useremail, password);

		if (u == null) {
			// login.....error massege
			// out.println("Invalid details try again");
			message msg = new message(" invalid details ! try with another", "error", "alert-danger");
			res.sendRedirect("login.jsp");
			HttpSession s = req.getSession();

			s.setAttribute("msg", msg);

		} else {
			// login success

			HttpSession hs = req.getSession();
			hs.setAttribute("currentuser", u);

			res.sendRedirect("profile.jsp");
		}

	}

}
