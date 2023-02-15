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

public class StudentDAO {
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstmt;
		
	public List<AchieveDTO> selectInfo(int userNum) throws SQLException {
		log.setLevel(Level.SEVERE);
		String sql = "select a.sub_name, a.score "
				+ "from achieve a inner join user b "
				+ "where a.user_num=? and a.user_num=b.num;";
		List<AchieveDTO> list = new ArrayList<AchieveDTO>();
		try {
			conn = MyConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AchieveDTO bean = new AchieveDTO();
				bean.setSubName(rs.getNString("sub_name"));
				bean.setScore(rs.getInt("score"));
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
