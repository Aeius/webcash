package model;

public class Member {
	private int num;
	private String m_id;
	private String name;
	private String email;
	private int age;
	private String gender;
	private String reg_date;
	private int level;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "{\"num\":" + num + ", \"m_id\":\"" + m_id + "\", \"name\":\"" + name + "\", \"email\":\"" + email + "\", \"age\":" + age
				+ ", \"gender\":\"" + gender + "\", \"level\":\""+level+"\", \"reg_date\":\"" + reg_date + "\"}";
	}
}
