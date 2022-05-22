package com.fred.proj.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fred.proj.service.BooKingService;
import com.fred.proj.util.Criteria;
import com.fred.proj.util.PageUtil;
import com.fred.proj.vo.NoticeVO;
import com.fred.proj.vo.bkVO;
import com.fred.proj.vo.userVO;

@Controller
@RequestMapping("booking/*")
public class BookingController {
	
	@Autowired
	BooKingService bsvc;
	
	
	@RequestMapping("booking")
	public ModelAndView booking () {
		ModelAndView mv = new ModelAndView();
		bkVO vo = new bkVO();
		mv.addObject("bkVO", vo);
		return mv;
	}
	
	@RequestMapping("bookinginsert")
	public ModelAndView bookinginsert (RedirectView rv, bkVO vo,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		userVO uservo = (userVO) session.getAttribute("SID");
		if(uservo != null) {
			vo.setUser_no(uservo.getUser_no());
		}
		
		bsvc.insertBooking(vo);
		
		rv.setUrl("/");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("booking_check")
	public ModelAndView booking_check(Criteria cri,HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		PageUtil pageutil = new PageUtil();
		userVO uservo = (userVO)session.getAttribute("SID");
		if(uservo != null) {
			cri.setUserno(uservo.getUser_no());
		}else {
			cri.setUserno(0);
		}
		
		
		if(cri.getKeyword() != null) {
			mv.addObject("search", cri);
		}
		
		pageutil.setCri(cri);
		pageutil.setTotalCount(bsvc.countBookingList(cri));
		List<bkVO> result = bsvc.listUser(cri);
		mv.addObject("result", result);
		mv.addObject("pageMaker", pageutil);
		
		return mv;
	}
	
	@RequestMapping("booking_check_non")
	public ModelAndView booking_check_non() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping("bookingTimeSet")
	@ResponseBody
	public List<bkVO> bookingTimeSet(bkVO vo){
	
	return bsvc.bookingTimeSet(vo); 	
	}
	@RequestMapping("searchCode")
	@ResponseBody
	public List<bkVO> searchCode(bkVO vo){
		
		return bsvc.searchCode(vo); 	
	}
}
