package com.fred.proj.vo;

import java.sql.Date;
import java.util.List;

public class userVO {
	
	private int user_no;
	private String user_id;
	private String user_name;
	private String user_password;
	private String user_email;
	private String user_number;
	private Date user_date;
	private Date user_update;
	private int user_sub;
	private int user_available;
	private String etc;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_number() {
		return user_number;
	}
	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public Date getUser_update() {
		return user_update;
	}
	public void setUser_update(Date user_update) {
		this.user_update = user_update;
	}
	public int getUser_sub() {
		return user_sub;
	}
	public void setUser_sub(int user_sub) {
		this.user_sub = user_sub;
	}
	public int getUser_available() {
		return user_available;
	}
	public void setUser_available(int user_available) {
		this.user_available = user_available;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
}
