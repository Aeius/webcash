package model;

public class InputTestData {
	public static void main(String[] args) {
		String sql="insert into restaurant (m_id, name, addr, reg_date) values ('test11','good place1', 'good good1', now());";
		for(int i=2;i<=20;i++) {
			sql+="insert into restaurant (m_id, name, addr, reg_date) values ('test11','good place"+i+"', 'good good"+i+"', now());";
		}
		System.out.println(sql);
	}
}
