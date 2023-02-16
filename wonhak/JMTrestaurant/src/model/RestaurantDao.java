package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Logger;

import customMysql.MysqlConnect;

public class RestaurantDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Logger log;
	
	public RestaurantDao() {
		try {
			if(conn==null || conn.isClosed()) conn = MysqlConnect.getConn();
			pstmt=null;
			rs=null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			log = Logger.getLogger("model.RestaurantDao");
		}
	}
	
	public ArrayList<Restaurant> getList(int currentPageNum, int countDataInPage, int countInPageGroup, String searchColumn, String searchValue){
		String sqlWhere=" where 1=1 ";
		if(!searchColumn.equals("") && !searchValue.equals("")) {
			 if(searchColumn.equals("name")) sqlWhere+="and rest.name like ? ";
			 if(searchColumn.equals("addr")) sqlWhere+="and rest.addr like ? ";
		}
		
		int startPage = currentPageNum*countDataInPage;
		String sql="select * from (select rest.*, @rownum:=@rownum+1 as num from restaurant rest, (select @rownum:=0 from dual) a "+sqlWhere+") b order by num asc limit "+startPage+", "+countDataInPage;
		log.info(sql);
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		try {
			log.info(searchColumn);
			log.info(searchValue);
			pstmt=conn.prepareStatement(sql);
			if(!searchColumn.equals("") && !searchValue.equals("")) {
				pstmt.setString(1, "%"+searchValue+"%");
			}
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Restaurant restaurant=new Restaurant();
				restaurant.setNum(rs.getInt("num"));
				restaurant.setR_id(rs.getInt("r_id"));
				restaurant.setM_id(rs.getString("m_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setAddr(rs.getString("addr"));
				restaurant.setContent(rs.getString("content"));
				restaurant.setImg1(rs.getString("img1"));
				restaurant.setImg2(rs.getString("img2"));
				restaurant.setImg3(rs.getString("img3"));
				restaurant.setImg4(rs.getString("img4"));
				restaurant.setImg5(rs.getString("img5"));
				restaurant.setLoc_x(rs.getDouble("loc_x"));
				restaurant.setLoc_y(rs.getDouble("loc_y"));
				restaurant.setReg_date(rs.getString("reg_date"));
				
				list.add(restaurant);
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
		
		return list;
	}
	
	public int getListTotalCount(String searchColumn, String searchValue) {
		String sqlWhere=" where 1=1 ";
		if(!searchColumn.equals("") && !searchValue.equals("")) {
			 if(searchColumn.equals("name")) sqlWhere+="and rest.name like ? ";
			 if(searchColumn.equals("addr")) sqlWhere+="and rest.addr like ? ";
		}
		
		String sql="select count(*) as cnt from restaurant rest "+sqlWhere;
		int totalDataCount=0;
		try {
			pstmt=conn.prepareStatement(sql);
			if(!searchColumn.equals("") && !searchValue.equals("")) {
				pstmt.setString(1, "%"+searchValue+"%");
			}
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				totalDataCount=rs.getInt("cnt");
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
		
		return totalDataCount;
	}
	
	public Restaurant getData(int r_id) {
		Restaurant restaurant = null;
		String sql="select * from restaurant where r_id = ?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				restaurant=new Restaurant();
				restaurant.setR_id(rs.getInt("r_id"));
				restaurant.setM_id(rs.getString("m_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setAddr(rs.getString("addr"));
				restaurant.setContent(rs.getString("content"));
				restaurant.setImg1(rs.getString("img1"));
				restaurant.setImg2(rs.getString("img2"));
				restaurant.setImg3(rs.getString("img3"));
				restaurant.setImg4(rs.getString("img4"));
				restaurant.setImg5(rs.getString("img5"));
				restaurant.setLoc_x(rs.getDouble("loc_x"));
				restaurant.setLoc_y(rs.getDouble("loc_y"));
				restaurant.setReg_date(rs.getString("reg_date"));
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
		
		return restaurant;
	}
	
	public int insertData(String m_id, String name, String addr, String content, String img1,
			String img2,String img3,String img4,String img5,double loc_x,double loc_y) {
		String sql="insert into restaurant (m_id, name, addr, content, img1, img2, img3, img4, img5, loc_x, loc_y, reg_date) values (?,?,?,?,?,?,?,?,?,?,?,now())";
		int resultNumber=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			pstmt.setString(2,name);
			pstmt.setString(3,addr);
			pstmt.setString(4,content);
			pstmt.setString(5,img1);
			pstmt.setString(6,img2);
			pstmt.setString(7,img3);
			pstmt.setString(8,img4);
			pstmt.setString(9,img5);
			pstmt.setDouble(10,loc_x);
			pstmt.setDouble(11,loc_y);
						
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
	
	public int updateData(int r_id, String m_id, String name, String addr, String content, String img1,
			String img2,String img3,String img4,String img5,double loc_x,double loc_y) {
		String sql="update restaurant set m_id=?, name=?, addr=?, content=?, loc_x=?, loc_y=?";
		if(img1!=null) sql+=", img1=?";
		if(img2!=null) sql+=", img2=?";
		if(img3!=null) sql+=", img3=?";
		if(img4!=null) sql+=", img4=?";
		if(img5!=null) sql+=", img5=?";
		sql+=", reg_date=now() where r_id=?";
		int resultNumber=0;
		try {
			int idx=1;
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(idx++,m_id);
			pstmt.setString(idx++,name);
			pstmt.setString(idx++,addr);
			pstmt.setString(idx++,content);
			pstmt.setDouble(idx++,loc_x);
			pstmt.setDouble(idx++,loc_y);
			if(img1!=null) pstmt.setString(idx++,img1);
			if(img2!=null) pstmt.setString(idx++,img2);
			if(img3!=null) pstmt.setString(idx++,img3);
			if(img4!=null) pstmt.setString(idx++,img4);
			if(img5!=null) pstmt.setString(idx++,img5);
			pstmt.setDouble(idx++,r_id);
						
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
	
	public int deleteData(int r_id) {
		String sql="delete from restaurant where r_id = ?";
		int resultNumber=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, r_id);
			
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
