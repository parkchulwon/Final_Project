package com.fred.proj.service;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fred.proj.dao.MainDAO;
import com.fred.proj.util.FileUtil;
import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.InfoVO;
import com.fred.proj.vo.NavVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Inject
	JavaMailSender mailSender;
	
	@Autowired
	MainDAO mdao;
	
	@Override
	public void sendMail(EmailVO email) {
		try {
			// 이메일 객체
			MimeMessage msg = mailSender.createMimeMessage();
			
			
			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
			msg.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiveMail()));
			
			
			/*
             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
             * 수신자 이메일 주소
             */
			msg.addFrom(new InternetAddress[] {new InternetAddress(email.getSenderMail(), email.getSenderName()) });
			
			
			// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
			msg.setSubject(email.getSubject(), "utf-8" );
			
			// 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
			msg.setText(email.getMessage(), "utf-8" );
			
//			html로 보낼 경우            
//          MimeMessage message = mailSender.createMimeMessage();
//          MimeMessageHelper helper 
//          = new MimeMessageHelper(message, true);
//          helper.setTo("test@host.com");
//          helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
			
//			메일전송
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void info_writeproc(InfoVO vo) {
		mdao.info_writeproc(vo);
		
	}
	@Override
	public void info_updateproc(InfoVO vo) {
		mdao.info_updateproc(vo);
	}
	
	@Override
	public FileVO insertFile(MultipartFile file, HttpServletRequest req, FileVO fInfo) throws Exception {
		FileVO fVO = new FileUtil().parseFileInfo(file, req, fInfo);
		/* fVO.setBoard_no(fInfo.getBoard_no()); */ //추후 idx로 수정하여 글번호 넣을 예정
		fVO.setGroup_code(fInfo.getGroup_code());		
		fVO.setUser_no(1);
		mdao.insertFile(fVO);
		
		return fVO;
	}
	
	@Override
	public InfoVO info_detail() {
		
		return mdao.info_detail();
	}
	
	@Override
	public List<NavVO> nav_list() {
		
		return mdao.nav_list();
	}
	@Override
	public void nav_update(NavVO nav) {
		
		mdao.nav_update(nav);
		
		
	}
	@Override
	public void t_update(NavVO nav) {
		
		mdao.t_update(nav);
	}
	
	@Override
	public void e_update(NavVO nav) {
		mdao.e_update(nav);
		
	}
	
	@Override
	public List<FileVO> f_list() {
		
		return mdao.f_list();
	}
	
	public void i_update(MultipartFile mfile, HttpServletRequest req, FileVO vo) throws Exception  {
		 vo = new FileUtil().parseFileInfo(mfile, req, vo) ;
		 
		mdao.i_update(vo);
	}
}
