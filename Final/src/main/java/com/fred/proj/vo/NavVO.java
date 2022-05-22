package com.fred.proj.vo;

public class NavVO {

	private int nav_no;
	private String nav_title;
	private  int nav_parent;
	private  int nav_depth;
	private  int nav_seq;
	private  int nav_available;
	private String etc;
	
	
	public int getNav_no() {
		return nav_no;
	}
	public void setNav_no(int nav_no) {
		this.nav_no = nav_no;
	}
	public String getNav_title() {
		return nav_title;
	}
	public void setNav_title(String nav_title) {
		this.nav_title = nav_title;
	}
	public int getNav_parent() {
		return nav_parent;
	}
	public void setNav_parent(int nav_parent) {
		this.nav_parent = nav_parent;
	}
	public int getNav_depth() {
		return nav_depth;
	}
	public void setNav_depth(int nav_depth) {
		this.nav_depth = nav_depth;
	}
	public int getNav_seq() {
		return nav_seq;
	}
	public void setNav_seq(int nav_seq) {
		this.nav_seq = nav_seq;
	}
	public int getNav_available() {
		return nav_available;
	}
	public void setNav_available(int nav_available) {
		this.nav_available = nav_available;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
}
