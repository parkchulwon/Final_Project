package com.fred.proj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fred.proj.vo.userVO;

@Repository
public class UserDAO {
	@Autowired
	SqlSession sqlsession;

	public void userjoin(userVO uservo) {
		sqlsession.insert("user_join", uservo);
	}

	public userVO user_get(userVO uservo) {
		return sqlsession.selectOne("user_get", uservo);
	}

	public userVO member(userVO uservo) {
		return sqlsession.selectOne("member", uservo);
	}

	public userVO user_idfind(userVO uservo) {
		userVO vo2 = new userVO();
		String str = sqlsession.selectOne("user_idfind", uservo);
		vo2.setUser_id(str);
		return vo2;
	}

	public userVO user_pwfind(userVO uservo) {
		userVO vo2 = new userVO();
		String str = sqlsession.selectOne("user_pwfind", uservo);
		vo2.setUser_password(str);
		return vo2;
	}

	public int idCheck(userVO uservo) {
		return sqlsession.selectOne("idCheck", uservo);
	}

	public int user_delete(userVO uservo) {
		return sqlsession.delete("user_delete", uservo);
	}

	public void user_update(userVO uservo) {

		sqlsession.update("user_update", uservo);
	}
}
