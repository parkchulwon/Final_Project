package com.fred.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fred.proj.dao.MenuDAO;
import com.fred.proj.util.FileUtil;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService  {

	@Autowired
	MenuDAO mdao;
	
	
	@Override
	public List<MenuVO> menuList() {
		return mdao.menuList();
	}
	
	@Override
	public MenuVO selectMenu(MenuVO vo) {
		return mdao.selectMenu(vo);
	}
	
	@Override
	public void menu_update(MenuVO vo, HttpServletRequest req) throws Exception {
		if(!vo.getMenu_file().isEmpty()) {
			FileVO fVO = new FileVO();
			fVO.setGroup_code(40);
			fVO = new FileUtil().parseFileInfo(vo.getMenu_file(), req, fVO);
			vo.setfVO(fVO);
		}
		
		mdao.menu_update(vo);
		
	}
	
}
