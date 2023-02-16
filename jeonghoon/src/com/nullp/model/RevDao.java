package com.nullp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import com.nullp.model.*;

public class RevDao {
	Logger log = Logger.getGlobal();

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt; // 보안을 위해서 등장, 속도 stmt에 비해 높음
	ResultSet rs;

	
	public void getConnection() {
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = System.getenv("MYSQL_USER");
		String password = System.getenv("MYSQL_PW");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(conn==null || conn.isClosed())
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public int reOne(int bernum,String uname,String sub,String content,int seq,int ref,int lvl ) throws SQLException {
		String sql="";
		
		try{
			getConnection();
			stmt=conn.createStatement();
		if(seq==0){
		String seqStr="(select max(seq)+1 from rev a where ref="+ref+")";
		sql = "insert into rev values ((select max(rnum)+1 from rev a),"+ref+","+seqStr+","+lvl+"+1,0,'"+uname+"','"+sub+"','"+content+"',now());";
		
		}else{
			sql = "update rev set seq=seq+1 where ref="+ref+" and seq>"+seq;
			stmt.executeUpdate(sql);
			stmt.close();
			stmt=conn.createStatement();
			sql ="insert into rev values ((select max(rnum)+1 from rev a), "+ref+", "+seq+"+1 , "+lvl+"+1, 0, '"+uname+"', '"+sub+"', '"+content+"', now());";
		}
		System.out.println(sql);
		return stmt.executeUpdate(sql);
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	}
	public int deleteOne(int rnum) throws SQLException {
		String sql = "delete from rev where rnum=?";
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			int result = pstmt.executeUpdate();
			log.info("delete cnt=" + result);
			return result;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
//	
//	public int deletRev(String uname, int rnum) throws SQLException {
//		String sql = "delete from rev where umane=? rnum=?";
//		try {
//			getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, uname);
//			pstmt.setInt(2, rnum);
//			int result = pstmt.executeUpdate();
//			log.info("delete cnt=" + result);
//			return result;
//		} finally {
//			if (pstmt != null)
//				pstmt.close();
//			if (conn != null)
//				conn.close();
//		}
//	}
	
	public int editOne(String sub, String content, int rnum) throws SQLException {
		String sql = "update rev set sub=?,content=?,writedate=now() where rnum=?";
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			pstmt.setString(2, content);
			pstmt.setInt(3, rnum);
			int result = pstmt.executeUpdate();
			log.info("update cnt=" + result);
			return result;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	public RevDto getOne(int rnum) throws SQLException {
		String sql = "select * from rev where rnum=?";
		String sql1 = "update rev set viewCnt=viewCnt+1 where rnum=?";
		RevDto bean = new RevDto();
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, rnum);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setContent(rs.getString("content"));
				bean.setLvl(rs.getInt("lvl"));
				bean.setRef(rs.getInt("ref"));
				bean.setRnum(rs.getInt("rnum"));
				bean.setSeq(rs.getInt("seq"));
				bean.setSub(rs.getString("sub"));
				bean.setUname(rs.getString("uname"));
				bean.setViewCnt(rs.getInt("viewCnt"));
				bean.setWriteDate(rs.getDate("writedate"));
				log.info(bean.toString());
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return bean;
	}

	public int pushList(String uname,String sub,String content) throws SQLException {
//		String sql = "insert into rev (ref,seq,lvl,uname,sub,content,writeDate) values (?,?,?,?,?,?,now())";
		String sql = "insert into rev (ref,seq,lvl,uname,sub,content,writeDate) values ((select IfNULL(max(rnum),0)+1 from rev b),0,0,?,?,?,now())";
		
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, sub);
			pstmt.setString(3, content);
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public List<RevDto> getList() throws SQLException {

		String sql = "select * from rev order by ref desc, seq asc";
		List<RevDto> list = null;
		list = new ArrayList<RevDto>();

		try {
			getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				RevDto bean = new RevDto();
				bean.setRnum(rs.getInt("rnum"));
				bean.setSub(rs.getString("sub"));
				bean.setUname(rs.getString("uname"));
				bean.setViewCnt(rs.getInt("viewCnt"));
				bean.setWriteDate(rs.getDate("writedate"));
				bean.setLvl(rs.getInt("lvl"));
				log.info(bean.toString());
				list.add(bean);
			}
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				log.severe(e.toString());
			}
		}
		return list;
	}
	
}
