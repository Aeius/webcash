package model;

public class Restaurant {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str="";
		for(int i=4;i<=100;i++) {
			str+="insert into member(m_id,password,name,email,age,gender) values('test"+i+"',md5('1234qwer'),'test"+i+"','test"+i+"@naver.com','15','F');";
		}
		System.out.println(str);
	}

}
