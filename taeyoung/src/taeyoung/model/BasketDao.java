package taeyoung.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BasketDao  {
	private String url, user,password;
	
	public BasketDao(String url, String user, String password) {
		this.url=url;
		this.user=user;
		this.password=password;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public boolean joincheck(String id) throws SQLException {
		String sql="select * from tyuser01 where id=?";
		try(
				Connection conn=DriverManager.getConnection(url,user,password);
				PreparedStatement pstmt=conn.prepareStatement(sql);
					) {
				pstmt.setString(1, id);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					return false;
				}else {
					return true;
				}
		}
		
	}
	
	public void joinOne(String id, String pw) throws SQLException {
			String sql="insert into tyuser01(id,pw) value(?,md5(?))";
			try(
					Connection conn=DriverManager.getConnection(url,user,password);
					PreparedStatement pstmt=conn.prepareStatement(sql);
						){
					pstmt.setString(1, id);
					pstmt.setString(2, pw);
					pstmt.executeUpdate();
				}
		
		
	}
	
	public boolean loginOne(String id, String pw) throws SQLException {
		String sql="select * from tyuser01 where id=? and md5(?)";
		try(
				Connection conn=DriverManager.getConnection(url,user,password);
				PreparedStatement pstmt=conn.prepareStatement(sql);
					) {
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					System.out.println(rs.getString("pw"));
					System.out.println("select의 rs값 있다");
					return true;
				}else {
					System.out.println("select의 rs값 없다");
					return false;
				}
		}
		
	}
	
	public int deleteOne(String db, int num) throws SQLException {
		String sql="delete from "+db+" where num=?";
		try(
				Connection conn=DriverManager.getConnection(url,user,password);
				PreparedStatement pstmt=conn.prepareStatement(sql);
				){
					pstmt.setInt(1, num);
				return pstmt.executeUpdate();
			}
	}
	
	public int editOne(String db,int num, String sub, String content) throws SQLException {
		String sql="update "+db+" set sub=?,content=? where num=?";
		try(
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			){
				pstmt.setString(1, sub);
				pstmt.setString(2, content);
				pstmt.setInt(3, num);
			return pstmt.executeUpdate();
		}
		
	}
	
	public int cnteditOne(String db,int num) throws SQLException {
		String sql="update "+db+" set cnt=cnt+1 where num=?";
		try(
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			){
				pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		}
		
	}
	
	public void insertOne(String db,String id, String sub, String content) throws SQLException {
		String sql="insert into "+ db +"(id,sub,content) value (?,?,?)";
		try(
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
				){
			pstmt.setString(1, id);
			pstmt.setString(2, sub);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
		}
		
	}
	
	public BasketDto selectOne(String db,int num) throws SQLException {
		String sql="select * from "+db+" where num=?";
		cnteditOne(db,num);
		try(
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
				) {
			pstmt.setInt(1, num);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				BasketDto bean=new BasketDto();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setSub(rs.getString("sub"));
				bean.setContent((rs.getString("content")).replaceAll("\n", "<br>"));
				bean.setCnt(rs.getInt("cnt"));
				
				return bean;
			}
			rs.close();
		}
		return null;
	}
	public List<BasketDto> getList(String table) throws SQLException{
		String sql="select * from "+table;
		List<BasketDto> list=new ArrayList<BasketDto>();
		try (
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();	
		){
			while(rs.next()) {
				BasketDto bean=new BasketDto();
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setSub(rs.getString("sub"));
				bean.setContent((rs.getString("content")).replaceAll("\r\n", "<br>"));
				bean.setCnt(rs.getInt("cnt"));
				list.add(bean);
			}
		} 
		finally {
			
		}
		return list;
	}

	

	

	

	

	
}
