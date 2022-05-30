package com.project.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.LikeDao;
import com.project.helpers.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/likeServlet")
public class likeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			res.setContentType("text/html");
			String op=req.getParameter("operation");
			int uid=Integer.parseInt(req.getParameter("uid"));
			int pid=Integer.parseInt(req.getParameter("pid"));
			//out.println(op+" "+pid+" "+uid);
			
			LikeDao dao=new LikeDao(ConnectionProvider.getConnection());
			if(op.equals("like")) {
				
				dao.insertLike(pid,uid);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
