package com.fred.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.fred.proj.util.Criteria;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.NoticeVO;

public interface NoticeService {
	public void notice_writeProc(NoticeVO vo);
	
	public FileVO insertFile(MultipartFile file, HttpServletRequest req, FileVO fInfo) throws Exception ;

	public int countBoardList(Criteria cri);

	public List<NoticeVO> list(Criteria cri);

	public NoticeVO detail(NoticeVO vo);

	public void notice_updateproc(NoticeVO vo);

	public void notice_delete(NoticeVO vo);
}
