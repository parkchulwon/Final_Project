package com.fred.proj.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fred.proj.service.MainService;
import com.fred.proj.service.UserService;
import com.fred.proj.vo.userVO;
import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.NavVO;

@Controller
@RequestMapping("jquery/*")
public class JqueryController {
	@Autowired
	UserService usvc;
	@Autowired
	MainService msvc;
	
	@RequestMapping(value = "idfind")
	@ResponseBody
	public String idfindCheck(userVO vo) {
		userVO vo2 = usvc.user_idfind(vo);		
		if(vo2.getUser_id() == null || vo2.getUser_id() == "") {
			vo2.setUser_id("fail");
		}
		return vo2.getUser_id();
	}
	
	@RequestMapping(value = "pwfind")
	@ResponseBody
	public String pwfindCheck(userVO vo) {
		userVO vo2 = usvc.user_pwfind(vo);		
		if(vo2.getUser_password() == null || vo2.getUser_password() == "") {
			vo2.setUser_password("fail");
		}
		return vo2.getUser_password();
	}

	@RequestMapping(value = "loginOK")
	@ResponseBody
	public int loginCheck(HttpSession session, userVO vo) {
		int num = 0;
		userVO vo2 = null;
		vo2 = usvc.login_check(vo);
		if(session.getAttribute("SID") != null) {
			session.removeAttribute("SID");
		}
		if (vo2 != null) {
			System.out.println("로그인 성공!");
			session.setAttribute("SID", vo2);
			num = 3;
		}else {
			System.out.println("로그인 실패");
			num = 2;
		}
		return num;
	}
		
	@RequestMapping(value ="logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }
	
	
	
	@RequestMapping(value = "emailCode")
	@ResponseBody
	public String emailCode(userVO email) {
		
        Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수
        
        for(int i=0;i<6;i++) {
		String ran = Integer.toString(rand.nextInt(10));
       
		int dupCd = 2;
		
        if(dupCd==1) {
            //중복 허용시 numStr에 append
            numStr += ran;
        }else if(dupCd==2) {
            //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
            if(!numStr.contains(ran)) {
                //중복된 값이 없으면 numStr에 append
                numStr += ran;
            }else {
                //생성된 난수가 중복되면 루틴을 다시 실행한다
                i-=1;
            }
        }
    }
        usvc.sendMail(email, numStr);
		return numStr;
	}
	
	@RequestMapping(value = "hide")
	@ResponseBody
	public void hide(NavVO nav) {
		
		msvc.nav_update(nav);
	}	
	
	@RequestMapping(value = "a_update")
	@ResponseBody
	public void a_update(NavVO nav, @RequestParam("bool") int bool) {
		if(bool == 1) {
			msvc.t_update(nav);
			
		} else {
			msvc.e_update(nav);
			
		}
	}
	
	@RequestMapping(value = "idCheck")
	@ResponseBody
	public int idCheck(userVO vo) {
		return usvc.idCheck(vo);
		
	}
}
