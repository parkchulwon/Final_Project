package com.fred.proj.service;

import java.util.List;

import com.fred.proj.util.Criteria;
import com.fred.proj.vo.bkVO;

public interface BooKingService {

	void insertBooking(bkVO vo);

	List<bkVO> bookingTimeSet(bkVO vo);

	int countBookingList(Criteria cri);

	List<bkVO> listUser(Criteria cri);

	List<bkVO> searchCode(bkVO vo);

}
