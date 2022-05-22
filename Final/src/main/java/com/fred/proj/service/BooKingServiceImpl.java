package com.fred.proj.service;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.fred.proj.dao.BooKingDAO;
import com.fred.proj.util.Criteria;
import com.fred.proj.util.MailUtil;
import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.bkVO;

@Service
public class BooKingServiceImpl implements BooKingService {

	
	@Autowired
	BooKingDAO bdao;
	
	@Inject
	JavaMailSender mailSender;
	
	@Override
	public void insertBooking(bkVO vo) {
		Random rnd =new Random();

		StringBuffer buf =new StringBuffer();

		for(int i=0;i<10;i++){

		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.

		    if(rnd.nextBoolean()){

		        buf.append((char)((int)(rnd.nextInt(26))+65));

		    }else{

		        buf.append((rnd.nextInt(10)));

		    }

		}



		vo.setEtc(buf.toString());
		
		EmailVO evo = new EmailVO();
		evo.setSenderName("스테이크 하우스");
		evo.setSenderMail("steak.house20220202@gmail.com");
		evo.setReceiveMail(vo.getBk_email());
		evo.setSubject(vo.getBk_name()+ " 님의 스테이크 하우스 예약정보 입니다.");
		String msg = "예악자 : " + vo.getBk_name();
		msg += "\n 예약일 : "+vo.getBk_date();
		msg += "\n 예약시간 : "+vo.getBk_time();
		msg += "\n 예약코드 : "+vo.getEtc();
		msg += "\n 요청사항 : "+vo.getBk_order();
		evo.setMessage(msg);
		MailUtil mutil = new MailUtil();
		mutil.sendMail(evo, mailSender);
		System.out.println(msg);
		
		bdao.insertBooking(vo);
	}
	
	@Override
	public List<bkVO> bookingTimeSet(bkVO vo) {
		return bdao.bookingTimeSet(vo);
	}
	
	@Override
	public int countBookingList(Criteria cri) {
		return bdao.countBookingList(cri);
	}
	
	@Override
	public List<bkVO> listUser(Criteria cri) {
		return bdao.listUser(cri);
	}
	
	@Override
	public List<bkVO> searchCode(bkVO vo) {
		// TODO Auto-generated method stub
		return bdao.searchCode(vo);
	}
}
