package com.jun.vo;

import java.util.Date;

public class MemberVO {
	private String user_id;
	private String user_pw;
	private String user_pwdq;
	private String user_pwda;
	private String user_name;
	private String user_nick;
	private String user_birth;
	private String user_email;
	private String user_phone;
	private String user_gender;
	private String user_oaddress;
	private String user_address;
	private String user_detailaddress;
	private int user_point;
	private Date user_regdate;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_pwdq() {
		return user_pwdq;
	}
	public void setUser_pwdq(String user_pwdq) {
		this.user_pwdq = user_pwdq;
	}
	public String getUser_pwda() {
		return user_pwda;
	}
	public void setUser_pwda(String user_pwda) {
		this.user_pwda = user_pwda;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_oaddress() {
		return user_oaddress;
	}
	public void setUser_oaddress(String user_oaddress) {
		this.user_oaddress = user_oaddress;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_detailaddress() {
		return user_detailaddress;
	}
	public void setUser_detailaddress(String user_detailaddress) {
		this.user_detailaddress = user_detailaddress;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public Date getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_pwdq=" + user_pwdq + ", user_pwda="
				+ user_pwda + ", user_name=" + user_name + ", user_nick=" + user_nick + ", user_birth=" + user_birth
				+ ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_gender=" + user_gender
				+ ", user_oaddress=" + user_oaddress + ", user_address=" + user_address + ", user_detailaddress="
				+ user_detailaddress + ", user_point=" + user_point + ", user_regdate=" + user_regdate + "]";
	}

}
