package com.hmall.team04.service.user;

import com.hmall.team04.dto.user.UserDTO;

public interface UserService {
	UserDTO findIdbyNameEmail(String usernm, String email) throws Exception;

	int findPwd(String id, String email, String pno) throws Exception;

	String getUserNamebyUserId(String userid) throws Exception;

	void comparePassword(String user_id, String old_pw) throws Exception;

	void updatePassword(String user_id, String old_pw, String new_pw) throws Exception;
}
