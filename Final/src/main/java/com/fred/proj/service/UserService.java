package com.fred.proj.service;

import com.fred.proj.vo.userVO;

public interface UserService {
	public void join(userVO uservo);

	public userVO login_check(userVO uservo);

	public void sendMail(userVO email, String num);

	public userVO member(userVO uservo);
	
	public userVO user_idfind(userVO uservo);
	
	public userVO user_pwfind(userVO uservo);
	
	public int idCheck(userVO uservo);
	
	public void user_delete(userVO uservo);
	
	public void user_update(userVO uservo);

}
