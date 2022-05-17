package com.hmall.team04.dao.user;

import com.hmall.team04.dto.user.UserVO;

public interface UserDAO {
	public UserVO selectUserInfo(String userid);
}
