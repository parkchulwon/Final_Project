package com.fred.proj.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.fred.proj.dao.UserDAO;
import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.userVO;

@Service
public class UserServiceImpl implements UserService {
@Inject
JavaMailSender mailSender;
	@Autowired
	UserDAO userDAO;
	
	public void join(userVO uservo) {
		userDAO.userjoin(uservo);
	}
	
	public userVO login_check(userVO uservo) {
		return userDAO.user_get(uservo);
	}
	
	@Override
	public void sendMail(userVO email, String num) {
		try {
			// 이메일 객체
			MimeMessage msg = mailSender.createMimeMessage();
			
			
			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
			msg.addRecipient(RecipientType.TO, new InternetAddress(email.getUser_email()));
			
			
			/*
             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
             * 수신자 이메일 주소
             */
			msg.addFrom(new InternetAddress[] {new InternetAddress("steak.house20220202@gmail.com", "fred") });
			
			
			// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
			msg.setSubject("이메일 인증", "utf-8" );
			
			// 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
			msg.setText("인증번호는"+" "+num+" "+"입니다" , "utf-8" );
			
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
	public userVO member(userVO uservo) {
	
		return userDAO.member(uservo);
	} 
	
	@Override
	public userVO user_idfind(userVO uservo) {
		return userDAO.user_idfind(uservo);
	}
	
	@Override
	public userVO user_pwfind(userVO uservo) {
		return userDAO.user_pwfind(uservo);
	}
	
	@Override
	public int idCheck(userVO uservo) {
		return userDAO.idCheck(uservo);
	}
	
	@Override
	public void user_delete(userVO uservo) {
		userDAO.user_delete(uservo);
	}
	
	@Override
	public void user_update(userVO uservo) {
		userDAO.user_update(uservo);	
	}
}
