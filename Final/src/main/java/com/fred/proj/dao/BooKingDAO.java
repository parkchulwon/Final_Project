package com.fred.proj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fred.proj.util.Criteria;
import com.fred.proj.vo.bkVO;

@Repository
public class BooKingDAO {
	
	@Autowired
	SqlSession sql;

	public void insertBooking(bkVO vo) {
		sql.insert("insertBooking",vo);
	}

	public List<bkVO> bookingTimeSet(bkVO vo) {
		return sql.selectList("bookingTimeSet", vo);
	}
	

	public int countBookingList(Criteria cri) {
		if(cri.getUserno() == 1) {
			return sql.selectOne("countBookingListAll",cri);
		}else {
			return sql.selectOne("countBookingList", cri);
		}
		
	}
	
	public List<bkVO> listUser(Criteria cri) {
		if(cri.getUserno() == 1) {
			return sql.selectList("listAll", cri);
		}else {
			return sql.selectList("listUser", cri);
		}
			
	}

	public List<bkVO> searchCode(bkVO vo) {
		return sql.selectList("searchCode",vo);
	}
}
