package com.fred.proj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.fred.proj.vo.EmailVO;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.InfoVO;
import com.fred.proj.vo.NavVO;

public interface MainService {
	
	public void sendMail(EmailVO email);

	public void info_writeproc(InfoVO vo);

	public void info_updateproc(InfoVO vo);

	public FileVO insertFile(MultipartFile file, HttpServletRequest req, FileVO fInfo) throws Exception ;

	public InfoVO info_detail();
	
	public List<NavVO> nav_list();
	
	public void nav_update(NavVO nav);
	
	public void t_update(NavVO nav);
	
	public void e_update(NavVO nav);
	
	public List<FileVO> f_list();
	
	public void i_update(MultipartFile mfile, HttpServletRequest req, FileVO vo) throws Exception ;
}
