package com.bit.model;

import java.util.Date;

public class StudentDTO {
	int userNum, score;
	String subName, name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "StudentDTO [userNum=" + userNum + ", score=" + score + ", subName=" + subName + ", name=" + name + "]";
	}
	
	
	
}
