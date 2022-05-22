package com.fred.proj.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	
	private int menu_no;
	private String menu_group;
	private String menu_name;
	private String menu_price;
	private String menu_info;
	private String menu_teg;
	private String etc;
	private MultipartFile menu_file;
	private List<MenuVO> menu_list;
	private String bool;
	private FileVO fVO;
	private String f_savename;
	
	
	public String getF_savename() {
		return f_savename;
	}
	public void setF_savename(String f_savename) {
		this.f_savename = f_savename;
	}
	public FileVO getfVO() {
		return fVO;
	}
	public void setfVO(FileVO fVO) {
		this.fVO = fVO;
	}
	public String getBool() {
		return bool;
	}
	public void setBool(String bool) {
		this.bool = bool;
	}
	public List<MenuVO> getMenu_list() {
		return menu_list;
	}
	public void setMenu_list(List<MenuVO> menu_list) {
		this.menu_list = menu_list;
	}
	public MultipartFile getMenu_file() {
		return menu_file;
	}
	public void setMenu_file(MultipartFile menu_file) {
		this.menu_file = menu_file;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_group() {
		return menu_group;
	}
	public void setMenu_group(String menu_group) {
		this.menu_group = menu_group;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_info() {
		return menu_info;
	}
	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}
	public String getMenu_teg() {
		return menu_teg;
	}
	public void setMenu_teg(String menu_teg) {
		this.menu_teg = menu_teg;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
}
