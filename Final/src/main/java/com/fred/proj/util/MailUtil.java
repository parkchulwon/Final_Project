package com.fred.proj.util;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;

import com.fred.proj.vo.EmailVO;

public class MailUtil {
	
	
	
	
	public void sendMail(EmailVO email, JavaMailSender mailSender) {
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
}
