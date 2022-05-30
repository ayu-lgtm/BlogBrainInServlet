package com.project.dao;

import java.sql.*;
import com.project.entities.user;

public class userdao {
	private Connection con;

	public userdao(Connection con) {
		this.con = con;
	}

	// method to insert user to data base:

	public boolean saveUser(user _user) {
		boolean f = false;
		try {

			// user --> database
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setString(1, _user.getName());
			pstmt.setString(2, _user.getEmail());
			pstmt.setString(3, _user.getPassword());
			pstmt.setString(4, _user.getGender());
			pstmt.setString(5, _user.getAbout());

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user email and password

	public user getUserByEmailAndPassword(String email, String password) {
		user _user = null;
		try {

			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {

				_user = new user();

				// data from db
				// set to user object
				_user.setName(res.getString("name"));

				_user.setId(res.getInt("id"));

				_user.setEmail(res.getString("email"));

				_user.setPassword(res.getString("password"));

				_user.setGender(res.getString("gender"));

				_user.setAbout(res.getString("about"));

				_user.setDateTime(res.getTimestamp("rdate"));

				_user.setProfile(res.getString("profile"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return _user;
	}
	// update into database

	public boolean updateUser(user _user) {
		boolean f = false;
		try {
			String query = "update user set name=? ,email=?,password=?,gender=?,about=?,profile=? where id=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, _user.getName());
			pstmt.setString(2, _user.getEmail());
			pstmt.setString(3, _user.getPassword());
			pstmt.setString(4, _user.getGender());
			pstmt.setString(5, _user.getAbout());
			pstmt.setString(6, _user.getProfile());
			pstmt.setInt(7, _user.getId());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//to get user name not his id
	public user getUserByUserId(int userId) {
		user _user=null;
		String q="select * from user where id = ?";
		PreparedStatement pst;
		
		try {
			pst = this.con.prepareStatement(q);
			pst.setInt(1,userId);
			ResultSet res=pst.executeQuery();
			if(res.next()) {
				_user = new user();

				// data from db
				// set to user object
				_user.setName(res.getString("name"));

				_user.setId(res.getInt("id"));

				_user.setEmail(res.getString("email"));

				_user.setPassword(res.getString("password"));

				_user.setGender(res.getString("gender"));

				_user.setAbout(res.getString("about"));

				_user.setDateTime(res.getTimestamp("rdate"));

				_user.setProfile(res.getString("profile"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return _user;
		
	}
}
