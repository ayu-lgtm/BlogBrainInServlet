package com.project.helpers;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {

            if (con == null) {
                // driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // create a connection..
                con = DriverManager.getConnection("jdbc:mysql://mydb.cfhldobhqvtl.us-west-2.rds.amazonaws.com:3306/mydb", "admin", "AyushRastogi2000");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}