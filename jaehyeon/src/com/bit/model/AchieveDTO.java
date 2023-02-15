package com.bit.model;

public class AchieveDTO {
	private int userNum, score;
	private String subName, userName;
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "{\"userNum\":\"" + userNum + "\", "
				+ "\"userName\":\"" + userName + "\", "
				+ "\"score\":" + score + ", "
				+ "\"subName\":\"" + subName + "\"}";
	}
}
