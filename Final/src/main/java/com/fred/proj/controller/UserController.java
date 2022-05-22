package com.fred.proj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fred.proj.service.UserService;
import com.fred.proj.vo.userVO;

@Controller
@RequestMapping("user/*")
public class UserController {
	@Autowired
	UserService usvc;

	@RequestMapping("user/login")
	public ModelAndView login() {

		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("user/join")
	public ModelAndView join() {

		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("user/member")
	public ModelAndView member(HttpSession session) {

		userVO uservo = (userVO) session.getAttribute("SID");
		ModelAndView mv = new ModelAndView();
		userVO result = usvc.member(uservo);
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping("user/delete")
	public ModelAndView delete(HttpSession session) {

		userVO uservo = (userVO) session.getAttribute("SID");
		ModelAndView mv = new ModelAndView();
		userVO result = usvc.member(uservo);
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping("user/member_info")
	public ModelAndView member_info(HttpSession session) {

		userVO uservo = (userVO) session.getAttribute("SID");
		ModelAndView mv = new ModelAndView();
		userVO result = usvc.member(uservo);
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping("user/idfind")
	public String user_idfind() {
		return "/user/idfind";
	}

	@RequestMapping("user/pwfind")
	public String user_pwfind() {
		return "/user/pwfind";
	}

	@RequestMapping("user/joinproc")
	@ResponseBody
	public ModelAndView joinproc(userVO uservo, RedirectView rv) {
		ModelAndView mv = new ModelAndView();
		usvc.join(uservo);
		rv.setUrl("login");
		mv.setView(rv);

		return mv;
	}

	@RequestMapping("user/user_delete")
	public ModelAndView user_delete(userVO uservo, RedirectView rv, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		usvc.user_delete(uservo);
		rv.setUrl("/");
		mav.setView(rv);

		session.setAttribute("SID", null);
		return mav;
	}
	
	@RequestMapping("user/user_update")
	public ModelAndView user_update(userVO uservo,RedirectView rv){
        ModelAndView mav = new ModelAndView();
        usvc.user_update(uservo);
        rv.setUrl("/");
        mav.setView(rv);
       
        return mav;
        
    }
	
	

}

