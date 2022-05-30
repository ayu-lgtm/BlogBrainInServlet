package com.project.dao;
import java.sql.*;

public class LikeDao {
	
	Connection con;

	public LikeDao(Connection con) {

		this.con = con;
	}
	
	public boolean insertLike(int pid,int uid) {
		boolean f=false;
		try {
			String q="insert into likepost(pid,uid) values(?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(q);
			
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			pstmt.executeUpdate();
			
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		
		int count=0;
		
		String q="select count(*) from likepost where pid=?";
		
		try {
			
			PreparedStatement pstmt = con.prepareStatement(q);
	
			pstmt.setInt(1, pid);
			
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				count=res.getInt("count(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		try {
			String q="select * from likepost where pid=? and uid=?";
			
			PreparedStatement pstmt = this.con.prepareStatement(q);
			
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			ResultSet res=pstmt.executeQuery();
			
			if(res.next()) {
				f=true;
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean DeleteLikeByUser(int pid,int uid) {
		boolean f=false;
		try {
			String q="delete from likepost where pid=? and uid=?";
			
			PreparedStatement pstmt = this.con.prepareStatement(q);
			
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			pstmt.executeUpdate();
			
			f=true;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
