package com.fred.proj.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NoticeVO {

	private int notice_no;
	private String notice_title;
	private String notice_content;
	private int notice_vcnt;
	private Date notice_date;
	private Date notice_update;
	private int notice_available;
	private int user_no;
	private String etc;
	private String dateform1;
	private String dateform2;
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
	
	
	public String getDateform1() {
		return dateform1;
	}
	public void setDateform1(Date date) {
		this.dateform1 = format1.format(date);
		
	}
	public String getDateform2() {
		return dateform2;
	}
	public void setDateform2(Date date) {
		this.dateform2 = format2.format(date);
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_vcnt() {
		return notice_vcnt;
	}
	public void setNotice_vcnt(int notice_vcnt) {
		this.notice_vcnt = notice_vcnt;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
		setDateform1(notice_date);
		setDateform2(notice_date);
	}
	public Date getNotice_update() {
		return notice_update;
	}
	public void setNotice_update(Date notice_update) {
		this.notice_update = notice_update;
		setDateform1(notice_date);
		setDateform2(notice_date);
	}
	public int getNotice_available() {
		return notice_available;
	}
	public void setNotice_available(int notice_available) {
		this.notice_available = notice_available;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_vcnt=" + notice_vcnt + ", notice_date=" + notice_date + ", notice_update="
				+ notice_update + ", notice_available=" + notice_available + ", user_no=" + user_no + ", etc=" + etc
				+ "]";
	}
	
	
}
