package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.logging.Logger;

import com.bit.util.MyConn;

public class UserDAO{
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
	public int insertUser(UserDTO bean) throws SQLException, SQLIntegrityConstraintViolationException {
		String sql = "insert into user value(0,?,?,?,?)";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setNString(2, bean.getName());
			pstmt.setNString(3, bean.getPw());
			pstmt.setNString(4, bean.getJob());
			return pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	public UserDTO login(UserDTO bean) throws SQLException {
		String sql = "select num, name, job from user where num=? and pw=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setNString(2, bean.getPw());
			rs = pstmt.executeQuery();
			UserDTO bean2 = new UserDTO();
			if(rs.next()) {
				bean2.setNum(rs.getInt("num"));
				bean2.setName(rs.getNString("name"));
				bean2.setJob(rs.getNString("job"));
			}
			return bean2;
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
}
