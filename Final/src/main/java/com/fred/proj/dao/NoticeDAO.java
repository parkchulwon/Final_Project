package com.fred.proj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fred.proj.util.Criteria;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSession sql;
	
	public void notice_writeProc(NoticeVO vo) {
		sql.insert("notice_write", vo);
	}

	public void insertFile(FileVO vo) {
		sql.insert("insertFile", vo);
		
	}

	public int countBoardList(Criteria vo) {
		return sql.selectOne("countBoardList", vo);
	}

	public List<NoticeVO> noticeList(Criteria vo){
		return sql.selectList("notice_getlist", vo);
	}

	public NoticeVO detail(NoticeVO vo) {
		sql.update("notice_Update_viewcnt",vo);
		return sql.selectOne("notice_detail", vo);
	}
	
	public void notice_updateproc(NoticeVO vo) {
		sql.update("notices_updateproc", vo);
	}
	public void notice_delete(NoticeVO vo) {
		sql.update("notices_delete", vo);
	}
}
