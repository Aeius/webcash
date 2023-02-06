package customMysql;

import java.sql.*;

public class MysqlConnect {
	private static String URL="jdbc:mysql://localhost:3306/";
	private static String DB="jmt";
	private static String MYSQL_USER="scott";
	private static String MYSQL_PASSWORD="tiger";
	private static Connection conn;
	
	public MysqlConnect() {
		
	}

	static public Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL+DB,MYSQL_USER,MYSQL_PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			if(e.getErrorCode()==1049) {
				try {
					conn = DriverManager.getConnection(URL,MYSQL_USER,MYSQL_PASSWORD);	
					createDB();
					conn.close();
					
					conn = DriverManager.getConnection(URL+DB,MYSQL_USER,MYSQL_PASSWORD);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			createTables();
		}
		
		return conn;
	}

	public void closeConn() {
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static void createDB() {
		String sql="";
		Statement stmt=null;
		
		try {
			sql="CREATE DATABASE IF NOT EXISTS jmt default CHARACTER SET UTF8";
			stmt = conn.createStatement();
			stmt.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void createTables() {
		String sql="";
		Statement stmt=null;
		
		try {
			sql="CREATE TABLE IF NOT EXISTS member(";
			sql+="m_id varchar(50) primary key,";
			sql+="name varchar(20) not null,";
			sql+="email varchar(50) not null,";
			sql+="age int not null default(0),";
			sql+="gender varchar(2) not null default('M') check (gender in ('M','F')),";
			sql+="reg_date datetime not null default(now())";
			sql+=")";
			stmt = conn.createStatement();
			stmt.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
