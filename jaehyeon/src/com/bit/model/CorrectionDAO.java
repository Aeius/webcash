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

public class CorrectionDAO {
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
	
	public int delete(int num) throws SQLException {
		log.setLevel(Level.INFO);
		String sql = "delete from correction where num=?";
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
		String sql = "update correction set title=?, content=? where num=?";
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
		String sql = "insert into correction value (0,?,?,?,now(),(select max(num)+1 from correction b),0,0,0)";
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
	
	public int reply(int userNum, String title, String content, int ref, int seq, int lvl) throws SQLException {
		// 주글에 답글 달 때
		if(seq == 0) {
			String sql = "insert into correction "
					+ "values(0,?,?,?,now(),?,"
					+ "(select max(seq)+1 from correction a where ref=?),?,0)";
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setNString(2, title);
			pstmt.setNString(3, content);
			pstmt.setInt(4, ref);
			pstmt.setInt(5, ref);
			pstmt.setInt(6, (lvl+1));
			int result = pstmt.executeUpdate();
			return result;
		// 답글에 답글 달 때
		} else {
			try {
				// 기존 답글의 값들 수정
				String sql = "update correction set seq=seq+1 where ref=? and seq>?";
				conn = MyConn.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, seq);
				pstmt.executeUpdate();
				pstmt.close();
				
				// 새로운 답글 추가
				String sql2 = "insert into correction values(0,?,?,?,now(),?,?,?,0)";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, userNum);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				pstmt.setInt(4, ref);
				pstmt.setInt(5, (seq+1));
				pstmt.setInt(6, (lvl+1));
				pstmt.executeUpdate();
			} finally {
				MyConn.close(pstmt);
				MyConn.close(conn);
			}
		}
		return 0;
	}
	
	public CorrectionDTO selectOne(int num) throws SQLException{
		log.setLevel(Level.SEVERE);
		String sql = "select num, user_num,"
				+ "(select name from user where num=a.user_num) as userName, "
				+ "title, content, date, cnt, ref, seq, lvl from correction a where num=?";
		String sql2 = "update correction set cnt=cnt+1 where num=?";
		CorrectionDTO bean = new CorrectionDTO();
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
				bean.setRef(rs.getInt("ref"));
				bean.setSeq(rs.getInt("seq"));
				bean.setLvl(rs.getInt("lvl"));
			}
			return bean;
		} finally {
			MyConn.close(rs);
			MyConn.close(pstmt);
			MyConn.close(conn);
		}
		
	}
	
	public List<CorrectionDTO> selectAll() throws SQLException {
		log.setLevel(Level.SEVERE);
		String sql = "select num, "
				+ "(select name from user where num=a.user_num) as user_name, "
				+ "title, content, date, cnt from correction a order by ref desc, seq asc limit 10";
		List<CorrectionDTO> list = new ArrayList<CorrectionDTO>();
		try {
			conn = MyConn.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CorrectionDTO bean = new CorrectionDTO();
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
