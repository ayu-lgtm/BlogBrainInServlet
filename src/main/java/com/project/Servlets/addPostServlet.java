package com.project.Servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.project.dao.PostDao;
import com.project.entities.post;
import com.project.entities.user;
import com.project.helpers.ConnectionProvider;
import com.project.helpers.ImageHelper;

@SuppressWarnings("serial")
@WebServlet("/addPostServlet")
@MultipartConfig
public class addPostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out =res.getWriter();
		int cid=Integer.parseInt(req.getParameter("cid"));
		String pTitle=req.getParameter("post-title");
		String pContent=req.getParameter("pst-content");
		String pCode=req.getParameter("post-code");
		
		Part part=req.getPart("post_pic");
		
		//getting current user id
		
		HttpSession hs =req.getSession();
		user _user=(user)hs.getAttribute("currentuser");
		
		post p=new post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,_user.getId());
		
		PostDao pd=new PostDao(ConnectionProvider.getConnection());
		
		if(pd.savePost(p)) {
			String path = "C:\\Users\\Ayush Rastogi\\eclipse-workspace\\ShoppingWeb\\src\\main\\webapp\\blogPic"
					+ File.separator + part.getSubmittedFileName();
			ImageHelper.saveFile(part.getInputStream(), path);
			out.println("done");
		}
		else {
			out.println("error");
		}
			
	}

}
