package com.bit.util;

import java.sql.SQLException;
import java.util.List;

import com.bit.model.NoticeDAO;
import com.bit.model.NoticeDTO;

public class TestNotice {
	static NoticeDTO target = new NoticeDTO();
	static NoticeDAO dao = new NoticeDAO();
	public static void main(String[] args) throws SQLException {
		target.setUserName("홍길동");
		// 입력 테스트
//		int user_num = 20230201;
//		String title = "제목테스트";
//		String content = "내용 테스트";
//		insertOneTest(user_num, title, content);
//		selectAllTest();
		// 수정 테스트
//		selectOneTest(4);
//		updateTest(4, "변경된 제목", "변경된 내용");
//		selectOneTest(4);
		// 삭제 테스트
//		selectOneTest(5);
//		deleteTest(5);
//		try {
//			selectOneTest(5);
//		} catch (SQLException | NullPointerException e) {
//			System.out.println("삭제 성공");
//		}
	}
	public static void deleteTest(int num) throws SQLException {
		int result = dao.delete(num);
		System.out.println("--delete");
		System.out.println(result!=0);
	}
	
	public static void updateTest(int num, String title, String content) throws SQLException {
		int result = dao.update(num, title, content);
		System.out.println("--update");
		System.out.println(result!=0);
	}
	
	public static void insertTest(int user_num, String title, String content) throws SQLException {
		int result = dao.insert(user_num, title, content);
		System.out.println("--insert");
		System.out.println(result!=0);
	}
	
	public static void selectOneTest(int num) throws SQLException {
		NoticeDTO bean = dao.selectOne(num);
		System.out.println("--selectOne");
		System.out.println(bean!=null);
		System.out.println(bean.getUserName().equals(target.getUserName()));
	}
	
	public static void selectAllTest() throws SQLException {
		List<NoticeDTO> list = dao.selectAll();
		System.out.println("--selectAll");
		System.out.println(list!=null);
		System.out.println(list.size()>0);
	}
}
