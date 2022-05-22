package com.fred.proj.controller;

import java.util.List;

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
import com.fred.proj.service.NoticeService;
import com.fred.proj.util.Criteria;
import com.fred.proj.util.PageUtil;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.NavVO;
import com.fred.proj.vo.NoticeVO;

@Controller
@RequestMapping("notice/*")
public class NoticeController {
	
	@Autowired
	NoticeService nsvc;
	@Autowired
	MainService msvc;
	
	@RequestMapping("notice/notices")
	public ModelAndView notices(Criteria cri) {
		
		ModelAndView mv = new ModelAndView();
		PageUtil pageutil = new PageUtil();
		
		if(cri.getKeyword() != null) {
			mv.addObject("search", cri);
		}
		
		pageutil.setCri(cri);
		pageutil.setTotalCount(nsvc.countBoardList(cri));
		List<NoticeVO> result = nsvc.list(cri);
		mv.addObject("result", result);
		mv.addObject("pageMaker", pageutil);
		
		return mv;
	}
	
	@RequestMapping("notice_detail")
	public ModelAndView notice_detail (NoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO result = nsvc.detail(vo);
		mv.addObject("result", result);
		
		return mv;
	}
	
	@RequestMapping("notice_update")
	public ModelAndView notice_update (NoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		NoticeVO result = nsvc.detail(vo);
		mv.addObject("result", result);
		
		return mv;
	}
	@RequestMapping("notice_updateproc")
	public ModelAndView notice_updateproc (NoticeVO vo, RedirectView rv, HttpSession httpsession) {
		ModelAndView mv = new ModelAndView();
		/* uservo uvo = (uservo)httpsession.getAttribute("SID"); */
		vo.setUser_no(1);
		
		nsvc.notice_updateproc(vo);
		
		rv.setUrl("notices");
		mv.setView(rv);
		return mv;
	}

	@RequestMapping("notice_delete")
	public ModelAndView notice_delete (NoticeVO vo, RedirectView rv, HttpSession httpsession) {
		ModelAndView mv = new ModelAndView();
		/* uservo uvo = (uservo)httpsession.getAttribute("SID"); */
		vo.setUser_no(1);
		
		nsvc.notice_delete(vo);
		
		rv.setUrl("notices");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("notice_write")
	public ModelAndView notice_write () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	

	
	@RequestMapping("notice_wirteproc")
	public ModelAndView notice_wirteproc(NoticeVO vo, RedirectView rv, HttpSession httpsession) {
		ModelAndView mv = new ModelAndView();
		/* uservo uvo = (uservo)httpsession.getAttribute("SID"); */
		vo.setUser_no(1);
		
		nsvc.notice_writeProc(vo);
		rv.setUrl("notices");
		mv.setView(rv);
		return mv;
	}
	

	
	@RequestMapping("header_update")
	public ModelAndView header_update () {
		ModelAndView mv = new ModelAndView();
		List<NavVO> nvo = msvc.nav_list();
		mv.addObject("nav_result", nvo);
		
		return mv;
	}
	
	@RequestMapping("map")
	public ModelAndView map () {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}


	@RequestMapping("upload")
	@ResponseBody
	public String fileupload_Test_proc(@RequestParam("file") MultipartFile file, HttpServletRequest req) throws Exception {
		FileVO fInfo = new FileVO();
		fInfo.setGroup_code(50);
		FileVO fVO = nsvc.insertFile(file, req,fInfo);
		
		return "/resources/upload/"+fVO.getF_savename();
	}
}
