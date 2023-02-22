package taeyoung.model;

public class BasketDto {
	private int num,cnt;
	private String sub,content,id;
	@Override
	public String toString() {
		return "{\"num\":"+num
				+ ", \"cnt\":"+cnt 
				+", \"sub\":\""+ sub
				+"\", \"content\":\"" + content
				+"\", \"id\":\""+ id + "\"}";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
