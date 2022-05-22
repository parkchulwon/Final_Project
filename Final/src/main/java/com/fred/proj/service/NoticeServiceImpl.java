package com.fred.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fred.proj.dao.NoticeDAO;
import com.fred.proj.util.Criteria;
import com.fred.proj.util.FileUtil;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO ndao;
	
	@Override
	public void notice_writeProc(NoticeVO vo) {
		ndao.notice_writeProc(vo);
	}
	
	@Override
	public FileVO insertFile(MultipartFile file, HttpServletRequest req, FileVO fInfo) throws Exception {
		FileVO fVO = new FileUtil().parseFileInfo(file, req, fInfo);
		/* fVO.setBoard_no(fInfo.getBoard_no()); */ //추후 idx로 수정하여 글번호 넣을 예정
		fVO.setGroup_code(fInfo.getGroup_code());
		
		fVO.setUser_no(1);
		ndao.insertFile(fVO);
		
		return fVO;
	}
	
	@Override
	public int countBoardList(Criteria cri) {
		return ndao.countBoardList(cri);
	}
	
	@Override
	public List<NoticeVO> list(Criteria cri) {
		return ndao.noticeList(cri);
	}
	
	@Override
	public NoticeVO detail(NoticeVO vo) {
		return ndao.detail(vo);
	}
	
	@Override
	public void notice_delete(NoticeVO vo) {
		ndao.notice_delete(vo);
	}
	
	@Override
	public void notice_updateproc(NoticeVO vo) {
		ndao.notice_updateproc(vo);
	}
}
