package com.fred.proj.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import com.fred.proj.util.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fred.proj.service.MainService;
import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.InfoVO;
import com.fred.proj.vo.NavVO;

@Controller
public class MainController {

	@Autowired
	MainService msvc;

	@RequestMapping("main/email_request")
	public ModelAndView email_request() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	@RequestMapping("main/loginpop")
	public ModelAndView loginpop() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

	@RequestMapping("main/email_send")
	public ModelAndView email_send(EmailVO email) {
		email.toString();

		ModelAndView mv = new ModelAndView("index");
		msvc.sendMail(email);
		return mv;
	}

	@RequestMapping("/")
	public ModelAndView main(HttpSession session) {
		ModelAndView mv = new ModelAndView("index");
		List<NavVO> nvo = msvc.nav_list();
		session.removeAttribute("nav_result");
		session.setAttribute("nav_result", nvo);
		
		List<FileVO> fvo = msvc.f_list();
		mv.addObject("f_list", fvo);
		return mv;
	}

	@RequestMapping("main/info_update")
	public ModelAndView info_update(InfoVO vo) {
		ModelAndView mv = new ModelAndView();
		InfoVO result = msvc.info_detail();
		mv.addObject("result", result);
		
		return mv;
	}

	@RequestMapping("main/info_write")
	public ModelAndView info_write() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("main/updateproc")
	public ModelAndView info_updateproc(InfoVO vo, RedirectView rv) {
		ModelAndView mv = new ModelAndView();
		System.out.println("왜않됢?");
		msvc.info_updateproc(vo);

		rv.setUrl("info");
		mv.setView(rv);
		return mv;
	}

	@RequestMapping("main/info_writeproc")
	public ModelAndView info_writeproc(InfoVO vo) {
		ModelAndView mv = new ModelAndView("main/info");
		msvc.info_writeproc(vo);

		return mv;
	}

	@RequestMapping("main/info")
	public ModelAndView info() {
		ModelAndView mv = new ModelAndView();

		InfoVO result = msvc.info_detail();

		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping("main/upload")
	@ResponseBody
	public String fileupload_Test_proc(@RequestParam("file") MultipartFile file, HttpServletRequest req)
			throws Exception {
		FileVO fInfo = new FileVO();
		fInfo.setGroup_code(30);
		FileVO fVO = msvc.insertFile(file, req, fInfo);

		return "/resources/upload/" + fVO.getF_savename();
	}

	@RequestMapping("main/my_question")
	public ModelAndView my_question() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("main/question_often")
	public ModelAndView question_often() {
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("main/img_update")
	public ModelAndView img_update() {
		ModelAndView mv = new ModelAndView();
		List<FileVO> fvo = msvc.f_list();
		mv.addObject("f_list", fvo);
		return mv;
	}

	@RequestMapping("/main/img_updateproc")
	public ModelAndView img_updateproc(MultipartFile[] upload, HttpServletRequest request, RedirectView rv) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		FileVO vo = new FileVO(); 
		vo.setGroup_code(20); 
		
		for (int i = 0; i < upload.length; i++) {
			if(!upload[i].isEmpty()) {
				
				vo.setIdx(i);
				msvc.i_update(upload[i], request, vo);
			}

		}
		rv.setUrl("/");
		mv.setView(rv);
		
		
		return mv;
	}

	
	
}
