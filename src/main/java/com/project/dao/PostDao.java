package com.project.dao;
import java.sql.*;
import java.util.*;

import com.project.entities.Catagory;
import com.project.entities.post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Catagory> getAllCategories() {
		ArrayList<Catagory> al = new ArrayList<>();
		try {

			String q = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");

				Catagory c = new Catagory(cid, name, description);
				al.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public boolean savePost(post p) {
		boolean f=false;
		try {
			String q="insert into post (pTitle,pContent,pCode,pPic,cid,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCid());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	//get all the post
	public ArrayList<post> getAllPost(){
		ArrayList<post> al=new ArrayList<post>();
		
		//fetch all the post
		try {
			
			PreparedStatement pstmt=con.prepareStatement("select * from post order by pid desc");
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String pTitle =rs.getString("pTitle");
				String pContent =rs.getString("pContent");
				String pCode =rs.getString("pCode");
				String pPic =rs.getString("pPic");
				Timestamp date=rs.getTimestamp("pDate");
				int cid=rs.getInt("cid");
				int userId=rs.getInt("userId");
				post p=new post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
				
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return al;
		
	}
	
	//get all post by id
	public ArrayList<post> getPostByCatId(int cid){
		ArrayList<post> al =new ArrayList<post>();
		
		//fetch all post by id
		try {
			
			PreparedStatement pstmt=con.prepareStatement("select * from post where cid=?");
			pstmt.setInt(1,cid);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int pid=rs.getInt("pid");
				String pTitle =rs.getString("pTitle");
				String pContent =rs.getString("pContent");
				String pCode =rs.getString("pCode");
				String pPic =rs.getString("pPic");
				Timestamp date=rs.getTimestamp("pDate");
				int userId=rs.getInt("userId");
				post p=new post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
				
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return al;
	}
	public post getPostByPostId(int pid) {
		
		post p=null;
		
		String query="select * from post where pid=?";
		
		try {
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			
			ResultSet rs=pstm.executeQuery();
			
			if(rs.next()) {
				int cid1=rs.getInt("cid");
				int pid1=rs.getInt("pid");
				String pTitle =rs.getString("pTitle");
				String pContent =rs.getString("pContent");
				String pCode =rs.getString("pCode");
				String pPic =rs.getString("pPic");
				Timestamp date=rs.getTimestamp("pDate");
				int userId=rs.getInt("userId");
				
				p=new post(pid1,pTitle,pContent,pCode,pPic,date,cid1,userId);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return p;
	}

}
