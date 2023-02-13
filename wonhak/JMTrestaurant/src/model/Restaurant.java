package model;

public class Restaurant {
	private int num;
	private int r_id;
	private String m_id;
	private String name;
	private String addr;
	private String content;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	private double loc_x;
	private double loc_y;
	private String reg_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public double getLoc_x() {
		return loc_x;
	}
	public void setLoc_x(double loc_x) {
		this.loc_x = loc_x;
	}
	public double getLoc_y() {
		return loc_y;
	}
	public void setLoc_y(double loc_y) {
		this.loc_y = loc_y;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "Restaurant [r_id=" + r_id + ", m_id=" + m_id + ", name=" + name + ", addr=" + addr + ", content="
				+ content + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + ", img5=" + img5
				+ ", loc_x=" + loc_x + ", loc_y=" + loc_y + ", reg_date=" + reg_date + "]";
	}
}
