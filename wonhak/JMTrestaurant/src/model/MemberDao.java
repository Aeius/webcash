package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import customMysql.MysqlConnect;

public class MemberDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Logger log;
	
	public MemberDao() {
		try {
			if(conn==null || conn.isClosed()) conn = MysqlConnect.getConn();
			pstmt=null;
			rs=null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			log = Logger.getLogger("model.MemberDao");
		}
	}
	
	public Member getData(String m_id) {
		Member member = null;
		String sql="select * from member where m_id = ?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				member=new Member();
				member.setM_id(rs.getString("m_id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAge(rs.getInt("age"));
				member.setGender(rs.getString("gender"));
				member.setLevel(rs.getInt("level"));
				member.setReg_date(rs.getString("reg_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return member;
	}
	
	public Member getData(String m_id, String password) {
		Member member = null;
		String sql="select * from member where m_id = ? and password=md5(?)";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, password);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				member=new Member();
				member.setM_id(rs.getString("m_id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAge(rs.getInt("age"));
				member.setGender(rs.getString("gender"));
				member.setLevel(rs.getInt("level"));
				member.setReg_date(rs.getString("reg_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return member;
	}
	
	public int insertData(String m_id, String password, String name, String email, int age, String gender) {
		String sql="insert into member (m_id, password, name, email, age, gender, reg_date) values (?,?,?,?,?,?,now())";
		int resultNumber=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			pstmt.setString(4,email);
			pstmt.setInt(5,age);
			pstmt.setString(6,gender);
						
			resultNumber=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return resultNumber;
	}
	
	public boolean closeConnection() {

		try {
			if(conn!=null) conn.close();
			return conn.isClosed();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
