package com.fred.proj.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fred.proj.service.MenuService;
import com.fred.proj.vo.MenuVO;

@Controller
@RequestMapping("menu/*")
public class MenuController {
	
	@Autowired
	MenuService msvc;
	
	@RequestMapping("menu_update")
	public ModelAndView menu_update () {
		ModelAndView mv = new ModelAndView();
		List<MenuVO> result = msvc.menuList();
		
		mv.addObject("result", result);
		return mv;
	}
	
	@RequestMapping("menuboard")
	public ModelAndView menuboard () {
		ModelAndView mv = new ModelAndView();
		List<MenuVO> result = msvc.menuList();
		
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping("menuinfo")
	@ResponseBody
	public MenuVO menuinfo(MenuVO vo) {
		
		return msvc.selectMenu(vo); 
	}
	
	@RequestMapping("menu_updateProc")
	public ModelAndView  menu_updateProc(MenuVO vo, RedirectView rv, HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		for (MenuVO listVO : vo.getMenu_list()) {
			if(listVO != null) {
				msvc.menu_update(listVO, req);
			}
		}
		rv.setUrl("menuboard");
		mv.setView(rv);
		
		return mv; 
	}
	
	
	
	@RequestMapping("beverage_menu")
	public ModelAndView beverage_menu () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("pasta_menu")
	public ModelAndView pasta_menu () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("set_menu")
	public ModelAndView set_menu () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("side_menu")
	public ModelAndView side_menu () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("steak_menu")
	public ModelAndView steak_menu () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	
	
}
