package com.fred.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fred.proj.vo.MenuVO;

public interface MenuService {

	List<MenuVO> menuList();

	MenuVO selectMenu(MenuVO vo);

	void menu_update(MenuVO vo, HttpServletRequest req) throws Exception;

}
