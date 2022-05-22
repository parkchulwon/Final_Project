package com.fred.proj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fred.proj.util.FileUtil;
import com.fred.proj.vo.FileVO;
import com.fred.proj.vo.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	SqlSession sql;

	public List<MenuVO> menuList() {
		return sql.selectList("menuList");
	}

	public MenuVO selectMenu(MenuVO vo) {
		return sql.selectOne("selectMenu", vo);
	}

	public void menu_update(MenuVO vo) {
		
		/* etc  삭제/ 블라인드 여부/ bool 데이터 변경 여부/ menu_no : 신규데이터 판단 여부
		 * 1차 데이터 거르기
		 * etc가
		 * menu_no값이 0인가? 
		 * 					ㄴ Yes
		 * 						: Etc 값이 1인가?
		 * 							ㄴ Yes
		 * 								: Menu Insert를 수행
		 * 							ㄴ No
		 * 								: 아무것도 수행하지 않음
		 *
		 * 					ㄴ No
		 * 						: Etc 값이 1인가?
		 * 							ㄴ Yes
		 * 								: bool 값이 1인가?
		 * 									ㄴ Yes
		 * 										: Menu Update를 시킨다.
		 * 									ㄴ No
		 * 										: 아무것도 수행하지 않음
		 * 	
		 * 							ㄴ No
		 * 								: Menu Update에서 해당메뉴를 블라인드 시킴
		 */
		
		if(vo.getMenu_no() == 0) {
			
			if(vo.getEtc().equals("1")) {
				sql.insert("menu_insert", vo);
				if(vo.getfVO() != null) {
					vo.getfVO().setBoard_no(vo.getMenu_no());
					sql.insert("menu_insertFile", vo.getfVO());
				}
			}
			
		}else {
			
			if(vo.getEtc().equals("1")) {
				
				if(vo.getBool().equals("1")) {
					sql.update("menu_update",vo);
					if(vo.getfVO() != null) {
						vo.getfVO().setBoard_no(vo.getMenu_no());
						
						FileVO fVO = sql.selectOne("menu_selectFile",vo.getfVO());
						if(fVO != null) {
							new FileUtil().deleteFile(fVO);
							sql.update("menu_updateFile", vo.getfVO());
						}else {
							sql.insert("menu_insertFile", vo.getfVO());
						}
					}
				}
			}else {
				sql.update("menu_delete",vo);
			}
			
		}
	}
}
