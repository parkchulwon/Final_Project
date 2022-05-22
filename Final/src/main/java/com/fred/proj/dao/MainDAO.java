package com.fred.proj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.InfoVO;
import com.fred.proj.vo.NavVO;
@Repository
public class MainDAO {
	
	@Autowired
	SqlSession sql;

	public void info_writeproc(InfoVO vo) {
		sql.insert("info_writeproc", vo);
	}

	public void info_updateproc(InfoVO vo) {
		sql.update("info_updateproc", vo);
	}

	public void insertFile(FileVO vo) {
		sql.insert("main_insertFile", vo);
		
	}

	public InfoVO info_detail() {
		
		return sql.selectOne("info_detail");
	}
	
	public List<NavVO> nav_list() {
		
		return sql.selectList("nav_list");
		
	}
	
	public void nav_update(NavVO nav) {
		sql.update("nav_update", nav);
	}
	
	public void t_update(NavVO nav) {
		 sql.update("t_update", nav);
	}
	
	public void e_update(NavVO nav) {
		 sql.update("e_update", nav);
	}
	
	public List<FileVO> f_list() {
		return sql.selectList("f_list");
	}
	
	public void i_update(FileVO vo) {
		int	cnt = sql.selectOne("img_is_null", vo); // 1 or 0의 결과값
		if(cnt == 1) {
			sql.update("i_update", vo);
			
		} else {
			sql.insert("i_insert", vo);
			
		}
		
	}
}
