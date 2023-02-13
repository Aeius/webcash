package com.bit.model;

import java.util.Date;

public class NoticeDTO {
	private int num, cnt;
	private String title, content, userName;
	private Date date;
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "NoticeDTO [num=" + num + ", cnt=" + cnt + ", title=" + title + ", content=" + content + ", userName="
				+ userName + ", date=" + date + "]";
	}
	
	
}
