package com.project.Servlets;

import java.io.File;
import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.project.dao.userdao;
import com.project.entities.message;
import com.project.entities.user;
import com.project.helpers.ConnectionProvider;
import com.project.helpers.ImageHelper;

@SuppressWarnings("serial")
@WebServlet("/editServlet")
@MultipartConfig
public class editServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fetch all data
		// PrintWriter out=response.getWriter();

		String user_email = request.getParameter("user_email");
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("user_password");
		String user_textarea = request.getParameter("user_textarea");
		Part part = request.getPart("image"); // for image insertion
		String imageName = part.getSubmittedFileName();

		// get the user from session

		HttpSession hs = request.getSession();
		user _user = (user) hs.getAttribute("currentuser");
		_user.setName(user_name);
		_user.setEmail(user_email);
		_user.setPassword(user_password);
		_user.setAbout(user_textarea);

		String old_profile = _user.getProfile();
		_user.setProfile(imageName);

		// update database

		userdao dao = new userdao(ConnectionProvider.getConnection());

		boolean b = dao.updateUser(_user);

		if (b) {
			// out.println("updated");
			// path to find profile picture
			String path = "C:\\Users\\Ayush Rastogi\\eclipse-workspace\\ShoppingWeb\\src\\main\\webapp\\pics"
					+ File.separator + _user.getProfile();
			String path_old = "C:\\Users\\Ayush Rastogi\\eclipse-workspace\\ShoppingWeb\\src\\main\\webapp\\pics"
					+ File.separator + old_profile;

			// System.out.print(path);
			if (old_profile.equals("default.jpg") == false) {
				ImageHelper.deleteFile(path_old);
			}

			if (ImageHelper.saveFile(part.getInputStream(), path)) {
				// out.println("profile updated 3");
				message msg = new message(" Profile details Updated !", "Success", "alert-success");
				// HttpSession s=request.getSession(); //already session use in upper lines 42
				hs.setAttribute("msg", msg);
			}
		} else {
			message msg = new message(" Something went wrong !", "error", "alert-danger");
			hs.setAttribute("msg", msg);
		}

		response.sendRedirect("profile.jsp");

	}

}
