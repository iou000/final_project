package com.hmall.team04.service.user;

import com.hmall.team04.dto.user.UserDTO;

public interface UserService {
	UserDTO findIdbyNameEmail(String usernm, String email) throws Exception;

	int findPwd(String id, String email, String pno) throws Exception;
	
}
