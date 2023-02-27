package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.bit.util.MyConn;

public class NoticeDAO {
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public int delete(int num) throws SQLException {
		log.setLevel(Level.INFO);
		String sql = "delete from notice where num=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result = pstmt.executeUpdate();
			return result;
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	
	public int update(int num, String title, String content) throws SQLException {
		log.setLevel(Level.INFO);
		String sql = "update notice set title=?, content=? where num=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, title);
			pstmt.setNString(2, content);
			pstmt.setInt(3, num);
			int result = pstmt.executeUpdate();
			return result;
		}  finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	
	public int insert(int user_num, String title, String content) throws SQLException {
		log.setLevel(Level.SEVERE);
		String sql = "insert into notice value (0,?,?,?,now(),0)";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_num);
			pstmt.setNString(2, title);
			pstmt.setNString(3, content);
			int result = pstmt.executeUpdate();
			return result;
		}  finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	
	public NoticeDTO selectOne(int num) throws SQLException{
		log.setLevel(Level.SEVERE);
		String sql = "select num, user_num, "
				+ "(select name from user where num=a.user_num) as userName, "
				+ "title, content, date, cnt from notice a where num=?";
		String sql2 = "update notice set cnt=cnt+1 where num=?";
		NoticeDTO bean = new NoticeDTO();
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setUserNum(rs.getInt("user_num"));
				bean.setUserName(rs.getNString("userName"));
				bean.setTitle(rs.getNString("title"));
				bean.setContent(rs.getNString("content"));
				bean.setDate(rs.getDate("date"));
				bean.setCnt(rs.getInt("cnt"));
			}
			return bean;
		} finally {
			MyConn.close(rs);
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
		
	}
	
	public List<NoticeDTO> selectAll() throws SQLException {
		log.setLevel(Level.SEVERE);
		String sql = "select num, "
				+ "(select name from user where num=a.user_num) as user_name, "
				+ "title, content, date, cnt from notice a order by num desc limit 10";
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		try {
			conn = MyConn.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				NoticeDTO bean = new NoticeDTO();
				bean.setNum(rs.getInt("num"));
				bean.setUserName(rs.getString("user_name"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getDate("date"));
				bean.setCnt(rs.getInt("cnt"));
				log.info(bean.toString());
				list.add(bean);
			}
			return list;
		} finally {
			MyConn.close(rs);
			MyConn.close(stmt);
			MyConn.close(conn);
		}
	}
}
