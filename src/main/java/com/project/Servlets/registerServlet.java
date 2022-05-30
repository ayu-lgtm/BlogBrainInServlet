package com.project.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.userdao;
import com.project.entities.user;
import com.project.helpers.ConnectionProvider;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
@MultipartConfig // for data anytype
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerServlet() {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


		PrintWriter out = res.getWriter();

		String check = req.getParameter("check");
		// out.println(check);

		if (check == null) {
			out.println("checkBox not checked");

		} else {
			// baki ka data
			String user_name = req.getParameter("user_name");
			String user_email = req.getParameter("user_email");
			String user_password = req.getParameter("user_password");
			String gender = req.getParameter("gender");
			String about = req.getParameter("about");

			// create user object and set all data to that object
			user _user = new user(user_name, user_email, user_password, gender, about);

			// create a user dao object

			userdao dao = new userdao(ConnectionProvider.getConnection());

			if (dao.saveUser(_user)) {
				// save...
				out.println("done");
			} else {
				out.println("Already Registered With this Email id");
			}

		}

	}

}
