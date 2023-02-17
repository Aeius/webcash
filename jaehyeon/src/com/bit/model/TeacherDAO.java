package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.bit.util.MyConn;

public class TeacherDAO {
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public List<SubjectDTO> selectSubject() throws SQLException{
		String sql = "select * from subject";
		List<SubjectDTO> list = new ArrayList<SubjectDTO>();
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SubjectDTO bean = new SubjectDTO();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getNString("name"));
				list.add(bean);
			}
			return list;
		} finally {
			MyConn.close(rs);
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	
	public List<AchieveDTO> selectAchieve(String subject) throws SQLException {
		log.setLevel(Level.SEVERE);
		String sql = "select a.user_num, a.score, a.sub_name, (select name from user where num=a.user_num) as user_name "
				+ "from achieve a inner join subject b "
				+ "where b.name=? and a.sub_name=b.name";
		List<AchieveDTO> list = new ArrayList<AchieveDTO>();
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AchieveDTO bean = new AchieveDTO();
				bean.setUserNum(rs.getInt("user_num"));
				bean.setUserName(rs.getNString("user_name"));
				bean.setSubName(rs.getNString("sub_name"));
				bean.setScore(rs.getInt("score"));
				log.info(bean.toString());
				list.add(bean);
			}
			return list;
		} finally {
			MyConn.close(rs);
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}

	public void insertSubject(String sub) throws SQLException, SQLIntegrityConstraintViolationException {
		String sql = "insert into subject value(0, ?)";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, sub);
			pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}

	public void insertAchieve(AchieveDTO bean) throws SQLException, SQLIntegrityConstraintViolationException {
		String sql = "insert into achieve value(?,?,?)";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getUserNum());
			pstmt.setNString(2, bean.getSubName());
			pstmt.setInt(3, bean.getScore());
			pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}

	public void updateAchieve(AchieveDTO bean) throws SQLException {
		String sql = "update achieve set score=? where user_num=? and sub_name=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getScore());
			pstmt.setInt(2, bean.getUserNum());
			pstmt.setNString(3, bean.getSubName());
			pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
		
	}

	public void deleteAchieve(AchieveDTO bean) throws SQLException {
		String sql = "delete from achieve where user_num=? and sub_name=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getUserNum());
			pstmt.setNString(2, bean.getSubName());
			pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
	public void deleteSub(SubjectDTO bean) throws SQLException {
		String sql = "delete from subject where name=?";
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, bean.getName());
			pstmt.executeUpdate();
		} finally {
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
	}
}
