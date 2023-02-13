package com.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyConn {
	static Connection conn;
	public static Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/board";
		String user = System.getenv("MYSQL_USER");
		String password = System.getenv("MYSQL_PW");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(conn==null || conn.isClosed()) {
				return conn = DriverManager.getConnection(url, user, password);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) throws SQLException {
		if(conn!=null) conn.close();
	}
	public static void close(Statement stmt) throws SQLException {
		if(stmt!=null) stmt.close();
	}
	public static void close(PreparedStatement pstmt) throws SQLException {
		if(pstmt!=null) pstmt.close();
	}
	public static void close(ResultSet rs) throws SQLException {
		if(rs!=null) rs.close();
	}
}
